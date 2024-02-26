class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    logger.debug @item.errors.inspect
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    if current_user && @item.user == current_user
      if @item.order.present?
        redirect_to root_path and return
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user && @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :message, :category_id, :price, :condition_id, :shipping_cost_burden_id, :prefecture_id, :day_to_ship_id).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
