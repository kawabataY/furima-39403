class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :street_number, :building_name, :phone_num, :item_id, :user_id, :token, :price


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1 }
    validates :city
    validates :street_number
    validates :phone_num, format: {with: /\A[0-9]{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください"}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(post_num: post_num, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_num: phone_num, order_id: order.id)
  end

end