class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]
  before_action :record_item, only:[:index, :create]

  def index
    @records_addresses = RecordsAddresses.new
  end


  def create
    @records_addresses = RecordsAddresses.new(records_params)
    if @records_addresses.valid?
      pay_item
      @records_addresses.save
      redirect_to root_path
    else
      render :index
    end  
  end

  




  private

  def records_params
    params.require(:records_addresses).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :image).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: records_params[:token],    
        currency: 'jpy'                
      )
  end

  def sold_out_item
    redirect_to root_path if @item.record.present?
  end
  
  def record_item
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end
end
