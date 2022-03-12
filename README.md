# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first-name         | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :items
- has_many :buy_logs
- has_one :address

## items テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| item_name | string    | null: false                    |
| price     | integer   | null: false                    |
| text      | text      | null: false                    |
| user      | reference | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buy_log
- has_one :detail
- has_one :delivery

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
| post_code      | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| apartment      | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :delivery
- belongs_to :buy_log

## details テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| category   | string     | null: false                    |
| conditione | string     | null: false                    |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## deliveries テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| pay     | string     | null: false                    |
| period  | string     | null: false                    |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :address