# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
<<<<<<< HEAD

### Association


## product テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product            | string | null: false |
| category           | string | null: false |
| product description| text   | null: false |
| product condition  | string | null: false |
| shipping fee burden| string | null: false |
| price              | string | null: false |
| shipping area      | string | null: false |
| delivery days      | string | null: false |

### Association


## purchase information テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product            | string | null: false |
| price              | string | null: false |
| shipping fee burden| string | null: false |

### Association

## shipping destination テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post cord          | string | null: false |
| prefecture         | string | null: false |
| municipalities     | string | null: false |
| street address     | string | null: false |
| building name      | string | null: false |
| telephone number   | string | null: false |




=======
| first_name         | string | null: false |
| last_name          | string | null: false |
| katakana_first_name| string | null: false |
| katakana_last_name | string | null: false |
| birthday           | date   | null: false |
### Association
 has_many :items
 has_many :purchasers

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references| null: false,foreign_key: true |
| category_id        | integer| null: false |
| item_description   | text   | null: false |
| item_condition_id  | integer| null: false |
| shipping_fee_burden_id| integer | null: false |
| price              | integer| null: false |
| prefecture_id     | integer| null: false |
| delivery_day_id   | integer| null: false |
| name               | string| null: false |
### Association
 belongs_to :user
 has_one :purchaser

## destinations テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_cord          | string | null: false |
| prefecture_id      | integer| null: false |
| municipality       | string | null: false |
| street_address     | string | null: false |
| building_name      | string | 
| telephone_number   | string | null: false |
| purchaser          | references | null: false,foreign_key: true |

### Association
 belongs_to :purchaser



## purchasers テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| user               | references|null: false,foreign_key: true |
| item               |references |null: false,foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :destination

>>>>>>> 5f5db119b4333c6bde21517df157bce3aa87024e













# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
