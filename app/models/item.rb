class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :image, :title, :description, presence: true
  validates :category_id, :condition_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates_inclusion_of :price, in:300..9999999

end
