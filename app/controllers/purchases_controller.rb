class PurchasesController < ApplicationController

  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

 def order_params
    params.permit(:token, :item_id, :postcode, :prefecture_id, :city, :block, :bilding, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if user_signed_in?
      if current_user.id == @item.user_id || @item.order.present?
        redirect_to root_path
      end
    else
      redirect_to user_session_path
    end
  end
end

