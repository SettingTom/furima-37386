class OrdersController < ApplicationController
  before_action :set_item
  before_action :user_restriction
  before_action :buyed_item_restriction

  def index
    @buy_log_address = BuyLogAddress.new
  end

  def create
    @buy_log_address = BuyLogAddress.new(order_params)
    if @buy_log_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @buy_log_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    @delivery_pays = DeliveryPay.find(@item.delivery_pay_id)
  end

  def order_params
    params.require(:buy_log_address).permit(:post_code, :area_id, :municipalities, :block_number, :apartment, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def user_restriction
    redirect_to root_path if @item.user_id == current_user.id
  end

  def buyed_item_restriction
    redirect_to root_path if @item.buy_log.present?
  end
end
