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

## items テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| item_name          | string       | null: false                    |
| description        | text         | null: false                    |
| category_id        | integer      | null: false                    |
| condition_id       | integer      | null: false                    |
| delivery_fee_id    | integer      | null: false                    |
| sender_address_id  | integer      | null: false                    |
| shipping_date_id   | integer      | null: false                    |
| price              | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| item                  | references   | null: false, foreign_key: true |
| user                  | references   | null: false, foreign_key: true |
| delivery_address      | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery_address

## delivery_addresses テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| post_num           | string       | null: false                    |
| prefecture_id      | integer      | null: false                    |
| city               | string       | null: false                    |
| street_number      | string       | null: false                    |
| building_name      | string       |                                |
| phone_num          | string       | null: false                    |

### Association

- belongs_to :order 
