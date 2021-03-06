class ItemsController < ApplicationController
  
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :login, only: [:update, :edit, :destroy]

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
    @item.update(item_params)
    if @item.valid?
       redirect_to root_path
    else
       render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @items = Item.all
    @items = Item.search(params[:keyword])
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :brand_id, :status_id, :delivery_fee_id, :area_id, :day_id, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def login
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
       redirect_to root_path
    end
  end
end
