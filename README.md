# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_ruby         | string | null: false               |
| last_ruby          | string | null: false               |
| birth_date         | date   | null: false               |

### Association

* has_many :items
* has_many :purchase_records

## items テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item                 | string     | null: false                    |
| item_content         | text       | null: false                    |
| item_category_id     | integer    | null:false                     |
| item_status_id       | integer    | null:false                     |
| item_shipping_fee_id | integer    | null:false                     |
| item_prefecture_id   | integer    | null:false                     |
| item_derivery_id     | integer    | null:false                     |
| item_price           | integer    | null: false                    |
| user                 | reference  | null: false foreign_key: true  |

### Association

* belongs_to :user
* has_many :purchase_records


## purchase_records テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_many :shipping_infos


## shipping_infos テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_number         | string     | null:false                     |
| item_prefecture_id  | integer    | null:false                     |
| purchaser_city      | string     | null:false                     |
| purchaser_address   | string     | null:false                     |
| purchaser_building  | string     |                                |
| telephone_number    | string     | null:false                     |

### Association

＊ belongs_to :purchase_record