class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :image, :title, :description, presence: true
  validates :category_id, :condition_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, numericality: { other_than: 1 , message: "を入力してください"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
