class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :prefecture, :shipping_charge, :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :title, :description, :price, presence: true
  validates :category_id, :condition_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end
