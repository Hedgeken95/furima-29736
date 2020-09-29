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
    if @item.valid?
       @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end