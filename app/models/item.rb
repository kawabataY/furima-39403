class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image
  has_one :order

  validates :item_name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, presence: true
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, presence: true
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_date_id, presence: true
  validates :shipping_date_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validate :price_range

  private

  def price_range
    return unless price.present? && (price < 300 || price > 9_999_999)

    errors.add(:price, 'は¥300から¥9,999,999の範囲内である必要があります。')
  end
end
