# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| katakana_first_name| string | null: false |
| katakana_last_name | string | null: false |

### Association
 has_many :items
 belongs_to :purchaser

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item               | string | null: false |
| category           | string | null: false |
| item description   | text   | null: false |
| item condition     | string | null: false |
| shipping fee burden| string | null: false |
| price              | string | null: false |
| shipping area      | string | null: false |
| delivery days      | string | null: false |

### Association
 belongs_to :user
 has_many :purchase information


## purchase information テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item               | string | null: false |
| price              | string | null: false |
| shipping fee burden| string | null: false |

### Association
 belongs_to :items
 has_one :destination

## destination テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post cord          | string | null: false |
| prefecture         | string | null: false |
| municipalities     | string | null: false |
| street address     | string | null: false |
| building name      | string | null: false |
| telephone number   | string | null: false |

### Association
 belongs_to :purchase information
 has_one :purchaser


## purchaser テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchaser          | string | null: false,foreign_key: true |
| purchase           | string | null: false |

### Association
 belongs_to :destination
 has_one :users














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
