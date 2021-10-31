# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | unique: true            |
| encrypted_password | string              | null: false             |
| first_name         | string              | null: false             |
| family_name        | string              | null: false             |
| first_name_kana    | string              | null: false             |
| family_name_kana   | string              | null: false             |

### Association

* has_many:items
* has_many:seller_items,foreign_key: true
* has_many:buyer_items,foreign_key: true

## items table

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| name               | string              | null: false                     |
| introduction       | text                | null: false                     |
| price              | integer             | null: false                     |
| item_condition     | integer             | null: false                     |
| category           | integer             | null: false                     |
| trading_status     | integer             | null: false                     |
| seller             | references          | null: false                     |
| user               | references          | null: false, foreign_key: true  |

### Association

*　has_many :item_images, dependent: :destroy
*　belongs_to :seller, class_name: "User"
*　belongs_to :buyer, class_name: "User"
