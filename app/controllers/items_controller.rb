class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :message, :category_id, :price, :condition_id, :shipping_cost_burden_id, :prefecture_id, :day_to_ship_id).merge(user_id: current_user.id)
  end

end
