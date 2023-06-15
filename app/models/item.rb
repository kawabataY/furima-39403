class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_id
  belongs_to :prefecture_id
  belongs_to :shipping_date
  has_one_attached :image

  
end
