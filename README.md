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
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name _kana    | string | null: false               |
| birthday           | date   | null: false               |
### Association
- has_many :items
- has_many :orders


## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | int        | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :order


## orders テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
### Association 
- has_one :address
- belongs_to :user
- belongs_to :item


## address テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| area_id        | integer    | null: false                    |
| city           | string     | null: false                    |
| house_name        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |
### Association
belongs_to :order
