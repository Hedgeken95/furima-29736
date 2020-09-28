class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end