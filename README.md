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

#テーブル設計
## users テーブル
| Column     | Type   | Options      |
| ---------- | ------ | ------------ |
| name       | string | null: false  |
| email      | string | unique: true |
| password   | string | null: false  |
| nickname   | string | unique: true |
| first_name | string | null: false  |
| last_name  | string | null: false  |
| birthday   | date   | null: false  |
### Association
- has_many :items
- has_many :purchases
- has_one :shipping_address


## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| price        | int        | null: false                    |
| Description  | string     | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| area         | string     | null: false                    |
| delivery_fee | int        | null: false                    |
| shipping_day | int        | null: false                    |
| user         | references | null: false, foreign_key: true |
### Association
- has_one :users


## purchases テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| price        | int        | null: false                    |
| user         | references | null: false, foreign_key: true |
### Association 
- has_one :shipping_address
- belongs_to :users


## shipping_address テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | int        | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | int        | null: false                    |
| user           | references | null: false, foreign_key: true |
### Association
- belongs_to :users
- belongs_to :purchases