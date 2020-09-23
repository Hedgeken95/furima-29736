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

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_name     | string  | null: false |
| item_text     | text    | null: false |
| Category      | integer | null: false |　
| Status        | integer | null: false |
| Delivery_fee  | integer | null: false |
| area          | integer | null: false |
| day           | integer | null: false |
| price         | integer | null: false |

### Association

- belongs_to :user
- has_one    :purchase

## purchase テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | varchar    | null: false |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


##  addressテーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postcode       | varchar | null: false |
| prefecture_id	 | int     | null: false |
| city           | varchar | null: false |
| block          | varchar | null: false |
| phone_number   | varchar | null: false |

### Association

- belongs_to :purchase