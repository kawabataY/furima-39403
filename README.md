# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| day_of_birth       | date   | null: false              |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |

### Association

- has_many :items
- has_many :orders

## item テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| item_name          | string       | null: false                    |
| description        | text         | null: false                    |
| category_id        | integer      | null: false                    |
| condition_id       | integer      | null: false                    |
| delivery_fee_id    | integer      | null: false                    |
| sender_address_id  | integer      | null: false                    |
| shipping_date_id   | integer      | null: false                    |
| price              | string       | null: false                    |
| user_id            | references   | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :orders

## orders テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| item_id               | references   | null: false, foreign_key: true |
| user_id               | references   | null: false, foreign_key: true |
| DeliveryAddressInfo_id| references| null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :DeliveryAddressInfo テーブル

## DeliveryAddressInfo テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| post_num           | string       | null: false                    |
| prefecture         | string       | null: false                    |
| city               | string       | null: false                    |
| street_number      | string       | null: false                    |
| building_name      | string       | null: true                     |
| phone_num          | string       | null: false                    |

### Association

- has_one :orders 
