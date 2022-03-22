class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
  
  private

  def item_params
    params.require(:itrm).permit(:image).merge(user_id: current_user.id)
  end
end
