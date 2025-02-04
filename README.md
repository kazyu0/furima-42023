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

## purchaser テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchaser          | string | null: false |
| purchase           | string | null: false |
















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
