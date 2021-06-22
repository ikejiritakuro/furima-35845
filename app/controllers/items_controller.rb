class ItemsController < ApplicationController
  def index
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



  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :area_id, :category_id, :shopping_day_id, :delivery_charge_id, :product_status_id).merge(user_id: current_user.id )
  end
end
