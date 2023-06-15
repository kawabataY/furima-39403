class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(tweet_params)
  end


  private

  def item_params
    params.require(:item).permit(:image_name,:image,:description,:category_id,:condition_id,:prefecture_id,:delivery_fee_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end
end
