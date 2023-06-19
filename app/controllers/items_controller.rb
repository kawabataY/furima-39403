class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :create]
  before_action :set_item, only: [:show, :edit, :update]
  
  def index
    @items = Item.order(created_at: :desc)
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
  end

  def edit
     if @item.user != current_user #|| @item.order.present?
       redirect_to root_path
     end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :condition_id, :prefecture_id, :delivery_fee_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
