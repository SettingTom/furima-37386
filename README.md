# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :buy_logs

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| price           | integer    | null: false                    |
| text            | text       | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_pay_id | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy_log

## buy_logs テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address
 
## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| area_id        | string     | null: false                    |
| municipalities | string     | null: false                    |
| block_number   | string     | null: false                    |
| apartment      | string     | null: false                    |
| phone_number   | string     | null: false                    |
| buy_log        | references | null: false, foreign_key: true |

### Association

- belongs_to :buy_log