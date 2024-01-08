# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password           | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | string     | null: false                    |
| category           | string     | null: false                    |
| image              | string     | null: false                    |
| price              | string     | null: false                    |
| condition          | string     | null: false                    |
| source             | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :purchases

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| number         | string     | null: false                    |
| date of expiry | string     | null: false                    |
| cvc            | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_many :shipping address

## shipping address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| delivery charge | string     | null: false                    |
| delivery date   | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases