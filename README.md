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

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |


### Association

- has_many :items
- has_many :parchases

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| item_name     | string     | null: false |
| item_text     | text       | null: false |
| category      | integer    | null: false |　
| status        | references | null: false, foreign_key:true|
| delivery_fee  | references | null: false, foreign_key:true|
| area          | references | null: false, foreign_key:true|
| day           | references | null: false, foreign_key:true|
| price         | integer    | null: false |

### Association

- belongs_to :user
- has_one    :purchase

## purchase テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


##  addressテーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postcode       | string  | null: false |
| prefecture_id	 | int     | null: false |
| city           | string  | null: false |
| block          | string  | null: false |
| building	     | string  | null: false |
| phone_number   | string  | null: false |

### Association

- belongs_to :purchase