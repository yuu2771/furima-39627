class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :municipalities, :house_number, :phone_number, :order_id

  validates :user_id, :item_id, :postal_code, :municipalities, :house_number, :phone_number, :order_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAdress.create(postal_code: postal_code, prefecture: prefecture, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end