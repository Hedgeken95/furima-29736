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
- has_many :parchase

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| item_image_id | int     | null: false |
| item_name     | string  | null: false |
| item_text     | text    | null: false |
| price         | integer | null: false |


### Association

- belongs_to :users
- has_one    :purchase

## purchase テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| card_num       | integer | null: false |
| security_code  | varchar | null: false |
| postcode       | varchar | null: false |
| city           | varchar | null: false |
| block          | varchar | null: false |
| phone_number   | varchar | null: false |

- belongs_to :users
- belongs_to :items