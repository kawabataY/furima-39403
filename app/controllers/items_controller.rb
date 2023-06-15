class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image_name,:image,:description,:category,:condition,:prefecture,:delivery_fee,:shipping_date,:price).merge(user_id: current_user.id)
  end
end
