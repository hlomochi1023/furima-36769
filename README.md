# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false, unique: true|
| encrypted_password | string              | null: false              |
| first_name         | string              | null: false              |
| family_name        | string              | null: false              |
| first_name_kana    | string              | null: false              |
| family_name_kana   | string              | null: false              |
| birthday           | date                | null: false              |


### Association

* has_many:items
* has_many:seller_items,foreign_key: true
* has_many:buyer_items,foreign_key: true

## seller table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false, unique: true|
| encrypted_password | string              | null: false              |
| first_name         | string              | null: false              |
| family_name        | string              | null: false              |
| first_name_kana    | string              | null: false              |
| family_name_kana   | string              | null: false              |
| birthday           | date                | null: false              |

### Association

* has_many:items
* belongs_to :user


## items table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| name               | string              | null: false                   |
| introduction       | text                | null: false                   |
| price              | integer             | null: false                   |
| item_condition     | integer             | null: false                   |
| category           | integer             | null: false                   |
| trading_status     | integer             | null: false                   |
| seller             | references          | null: false                   |
| user               | references          | null: false, foreign_key: true|

### Association

* has_many :item_images, dependent: :destroy
* belongs_to :seller, class_name: "User"
* belongs_to :buyer, class_name: "User"
* belongs_to_active_hash :item_category
* belongs_to_active_hash :item_condition
* belongs_to_active_hash :postage_payer
* belongs_to_active_hash :user_address
* belongs_to_active_hash :preparation_day

## addresses table

| Column             | Type                | Options                                    |
|--------------------|---------------------|--------------------------------------------|
| first_name         | string              | null: false                                |
| family_name        | string              | null: false                                |
| first_name_kana    | string              | null: false                                |
| family_name_kana   | string              | null: false                                |
| post_number        | string              | null: false                                |
| prefecture_id      | integer             | null:false, dafault: 0                     |
| city               | string              | null: false                                |
| house_number       | integer             | null: false                                |
| building_name      | string              | null: false                                |
| phone_number       | string              | null: false                                |
| user_id            | references          | null: false,null: false, foreign_key: true |

* belongs_to :user