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
| birth_year         | date   | null: false               |
| birth_month        | date   | null: false               |
| birth_day          | date   | null: false               |


## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | string     | null: false                    |
| item_content       | text       | null: false                    |
| item_category      |string      | null:false                     |
| item_status        | string     | null:false                     |
| item_shipping_fee  | string     | null:false                     |
| item_prefecture    |string      | null:false                     |
| item_derivery      |string      | null:false                     |
| item_price         |interger    | null: false                    |
| user               |reference   | null: false 外部キー            |


## purchase_record テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| content    | text       | null: false                    |


## shipping_info テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| posr_number         | interger   | null:false                     |
| purchaser_prefecture| string     | null:false                     |
| purchaser_city      | string     | null:false                     |
| purchaser_address   | string     | null:false                     |
| purchaser_building  | string     | null:false                     |
| telephone_number    | interger   | null:false                     |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |