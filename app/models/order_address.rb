class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :municipalities, :house_number, :building_name, :phone_number, :order_id

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :municipalities
  validates :house_number
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, length: { in: 10..11 }, numericality: { only_integer: true }
  end

  validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end