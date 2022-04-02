class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @users = User.find(@item.user_id)
    @categorys = Category.find(@item.category_id)
    @conditions = Condition.find(@item.condition_id)
    @delivery_pays = DeliveryPay.find(@item.delivery_pay_id)
    @areas = Area.find(@item.area_id)
    @delivery_days = DeliveryDay.find(@item.delivery_day_id)
  end

  def edit
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :text, :condition_id, :delivery_pay_id, :delivery_day_id, :area_id,
                                 :category_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
