class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :municipalities, :house_number, :building_name, :phone_number, :order_id

  validates :user_id, :item_id, :municipalities, :house_number, :order_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"}
  validates :phone_number, presence: true, format: { with: /\d{10,11}/ }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAdress.create(postal_code: postal_code, prefecture: prefecture, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end