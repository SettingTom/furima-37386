class OrdersController < ApplicationController
  def index
    @buy_log_address = BuyLogAddress.new
    @item = Item.find(params[:item_id])
    @delivery_pays = DeliveryPay.find(@item.delivery_pay_id)
  end

  def create
    @buy_log_address = BuyLogAddress.new(order_params)
    if @buy_log_address.valid?
      @buy_log_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:buy_log_address).permit(:post_code, :area_id, :municipalities, :block_number, :apartment, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end