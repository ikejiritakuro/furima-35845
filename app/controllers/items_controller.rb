class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy ]
  before_action :move_to_index, except: [:index, :show, :new, :create, :search ]
  before_action :search_item, only: [:index, :search, :show]

  def index
    @items = Item.order(id: 'DESC')
    set_item_column
  end

  def new
   @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new 
   end
  end

  def show    
  end


  def edit
    redirect_to root_path if @item.record.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else  
      render :edit
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end

  def search
    @results = @p.result
  end



  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :price, :area_id, :category_id, :shopping_day_id, :delivery_charge_id, :product_status_id).merge(user_id: current_user.id )
  end

  def move_to_index
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end 

  def search_item
    @p = Item.ransack(params[:q])  
  end

  def set_item_column
    @item_name = Item.select("name").distinct  
  end
end