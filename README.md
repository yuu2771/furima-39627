## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_furigana  | string  | null: false |
| first_name_furigana | string  | null: false |
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birth_day           | integer | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :shipping_addresses

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| description         | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shipping_charge     | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| shipping_days       | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreigh_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one :shipping_address

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreigh_key: true |
| item                | references | null: false, foreigh_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | integer    | null: false                    |
| prefectures         | string     | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | integer    | null: false                    |
| order               | references | null: false, foreigh_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order