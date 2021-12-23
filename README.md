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
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| content         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| derivery_id     | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | reference  | null: false foreign_key: true  |

### Association

* belongs_to :user
* has_one :purchase_record


## purchase_records テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :shipping_info


## shipping_infos テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_number         | string     | null:false                     |
| prefecture_id       | integer    | null:false                     |
| purchaser_city      | string     | null:false                     |
| purchaser_address   | string     | null:false                     |
| purchaser_building  | string     |                                |
| telephone_number    | string     | null:false                     |
| purchase_record     | references | null: false, foreign_key: true |

### Association

＊ belongs_to :purchase_record

