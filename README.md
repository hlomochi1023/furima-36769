# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| family_name        | string              | null: false               |
| first_name_kana    | string              | null: false               |
| family_name_kana   | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many:items
* has_many:buyers

## items table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| name               | string              | null: false                    |
| introduction       | text                | null: false                    |
| price              | integer             | null: false                    |
| condition_id       | integer             | null: false                    |
| category_id        | integer             | null: false                    |
| delivery_charge_id | integer             | null: false                    |
| delivery_day_id    | integer             | null: false                    |
| prefecture_id      | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_one:buyer

## buyer_addresses table

| Column             | Type                | Options                                    |
|--------------------|---------------------|--------------------------------------------|
| post_code          | string              | null: false                                |
| prefecture_id      | integer             | null: false                                |
| city               | string              | null: false                                |
| address            | string              | null: false                                |
| building_name      | string              |                                            |
| phone_number       | string              | null: false                                |
| buyer              | references          | null: false, foreign_key: true             |

### Association

* belongs_to :buyer

## buyers table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :addresses
