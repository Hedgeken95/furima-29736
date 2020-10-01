class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :login, only: [:update, :edit]

  def index
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


  def update
    if @item.valid?
       @item.update(item_params)
       redirect_to root_path
    else
       render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def login
    current_user.id == @item.user_id
  end
end
