class OrdersController < ApplicationController
  def index
    @buy_log_address = BuyLogAddress.new
  end

  def create
    binding.pry
    # @buy_log_address = BuyLogAddress.new(order_params)
    # redirect_to "/items/#{order.item.id}"
  end

  private

  def order_params
    params.require(:buy_log_address).permit(:post_code, :area_id, :municipalities, :block_number, :apartment, :phone_number).merge(user_id: current_user.id)
  end
end