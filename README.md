## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| birthday           | integer | null: false              |


### Association

has_many :items
has_many :purchases

## items テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| title       | string | null: false |
| explain     | text   | null: false |
| category_id | integer | null: false |
| prefecture_id    | integer | null: false |
| freight_id  | integer | null: false |
| shipname_id | integer | null: false |
| shipdate_id | integer | null: false |
| price       | integer | null: false |
| user        | references | null: false, foreign_key: true |


### Association

belongs_to :user
has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | string     | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :shipping

## shippings テーブル

| Column       | Type    | Options      |
| ------------ | --------| ------------ |
| postalcode   | string  | null: false  |
| prefecture   | string  | null: false  |
| city         | string  | null: false  |
| address      | string  | null: false  |
| building     | string  |              |
| phone_number | string  | null: false  |
| purchase     | string  | null: false, foreign_key: true  |


### Association

belongs_to :purchase