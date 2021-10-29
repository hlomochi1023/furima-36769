# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| first_name         | string              | null: false             |
| family_name        | string              | null: false             |
| first_name_kana    | string              | null: false             |
| family_name_kana   | string              | null: false             |
| post_code          | string              | null: false             |
| city               | string              | null: false             |
| house_number       | string              | null: false             |
| building_name      | string              | null: false             |
| phone_number       | string              | null: false             |
| birth_date         | date                | null: false             |
| prefecture_code    | integer             | null: false             |

### Association

* has_many:seller_items, foreign_key: true
* has_many:buyer_items, foreign_key: true
* has_one :profile, dependent: :destroy
* has_one :credit_card, dependent: :destroy
* Gem : jp_prefecture

## profiles table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| introduction                        | text       |                                |
| avatar                              | string     |                                |
| user                                | references | null: false, foreign_key: true |

### Association

* belongs_to :user

## credit_card table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | integer    | null: false, foreign_key: true |
| customer_id | string     | null: false                    |
| card_id     | string     | null: false                    |

### Association

* belongs_to :user
* Gem :payjp

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| introduction       | text                | null: false             |
| price              | integer             | null: false             |
| brand              | integer             | null: false             |
| item_condition     | integer             | null: false             |
| postage_payer      | integer             | null: false             |
| preparation_day    | integer             | null: false             |
| postage_type       | integer             | null: false             |
| category           | integer             | null: false             |
| trading_status     | integer             | null: false             |
| seller             | references          | null: false             |
| buyer              | references          | null: false             |

### Association

*　has_many :item_images, dependent: :destroy
*　belongs_to :category
*　belongs_to_active_hash :item_condition
*　belongs_to_active_hash :preparation_day
*　belongs_to_active_hash :postage_type
*　belongs_to_active_hash :postage_payer
*　belongs_to :brand
*　belongs_to :seller, class_name: "User"
*　belongs_to :buyer, class_name: "User"
*　Gem : jp_prefecture

### brands table

| Column      | Type       | Options     |
|-------------|------------|-------------|
| name        | string     | null: false |

### Association

*　belongs_to :item

### categories table

| Column      | Type       | Options     |
|-------------|------------|-------------|
| name        | string     | null: false |
| ancesty     | string     | null: false |

### Association

*　has_many:items