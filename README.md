## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null:false, unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_date         | date   | null: false              |

### Association

- has_many :users_products
- has_many :products

## items テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| item_name              | string     | null: false       |
| item_info              | text       | null: false       |
| item_category          | integer    | null: false       |
| item_status_id         | integer    | null: false       |
| shopping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- has_one :users_items
- belongs_to :user

## buying_addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| addresses     | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| users_product | references | foreign_key: true |

### Association

- belongs_to :users_product

## users_products テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
has_one :buying_address