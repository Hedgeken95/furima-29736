class PurchasesController < ApplicationController

  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
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
    @item = Item.find(params[:item_id])
    params.permit(:token)
    params.require(:order_address).permit(:user_id, :item_id, :postcode, :prefecture_id, :city, :block, :bilding, :phone_number)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:item_id],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end

