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
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| nickname           | string | unique: true |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_name_kana    | string | null: false  |
| last_name _kana    | string | null: false  |
| birthday           | date   | null: false  |
### Association
- has_many :items
- has_many :purchases


## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| price        | int        | null: false                    |
| Description  | string     | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| area         | string     | null: false                    |
| delivery_fee | int        | null: false                    |
| shipping_day | int        | null: false                    |
| user         | references | null: false, foreign_key: true |
### Association
- belongs_to :user


## purchases テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
### Association 
- has_one :shipping_address
- belongs_to :user
- belongs_to :item


## shipping_address テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchases      | references | null: false, foreign_key: true |
### Association
