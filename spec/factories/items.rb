FactoryBot.define do
  factory :item do
    title                     {'商品名'}
    description               {'商品の説明'}
    category_id               {'3'}
    condition_id              {'3'}
    prefecture_id             {'3'}
    shipping_charge_id        {'3'}
    shipping_day_id           {'3'}
    price                     {'1000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
