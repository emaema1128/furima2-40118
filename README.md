## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

has_many :items
has_many :purchase

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| title    | string | null: false |
| explain  | text   | null: false |
| category | string | null: false |
| state    | string | null: false |
| freight  | string | null: false |
| shipname | string | null: false |
| shipdate | string | null: false |
| price    | string | null: false |
| user_id  | references | null: false, foreign_key: true |


### Association

belongs_to :user
has_one :purchase

## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| items   | string     | null: false                    |

### Association

belongs_to :user
belongs_to :items
has_one :shipping

## shipping テーブル

| Column       | Type    | Options      |
| ------------ | --------| ------------ |
| postalcode   | string  | null: false  |
| prefecture   | string  | null: false  |
| city         | string  | null: false  |
| address      | string  | null: false  |
| building     | string  | null: false  |
| phone_number | string  | null: false  |


### Association

belongs_to :purchase