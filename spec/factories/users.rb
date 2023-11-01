FactoryBot.define do
  factory :user do
    nickname                  {'taro'}
    email                     {Faker::Internet.email}
    password                  {'test000'}
    password_confirmation     {password}
    last_name                 {'山田'}
    first_name                {'太郎'}
    last_name_furigana        {'ヤマダ'}
    first_name_furigana       {'タロウ'}
    birthday                  {'2000-01-01'}
  end
end