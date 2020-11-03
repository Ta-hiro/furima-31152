# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| f_name             | string              | null: false             |
| f_name_kana        | string              | null: false             |
| l_name             | string              | null: false             |
| l_name_kana        | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many : items
* has_many : buys

## items table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| product_name                   | string     | null: false       |
| explanation                    | text       | null: false       |
| category                       | integer    | null: false       |
| product_status                 | integer    | null: false       |
| delivery_burden                | integer    | null: false       |
| i_todou                        | integer    | null: false       |
| shipping_period                | integer    | null: false       |
| price                          | integer    | null: false       |
| concept                        | text       | null: false       |
| user_id                        | references | foreign_key: true |
| buy_id                         | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| credit_status  | integer     | null: false       |
| expiration     | integer     | null: false       | 
| security_code  | integer     | null: false       |
| b_todou        | integer     | null: false       |
| postal_code    | text        | null: false       |
| phone_number   | text        | null: false       |
| sityousonn     | text        | null: false       |
| bannti         | text        | null: false       |
| tatemono       | text        | null: false       |
| item_id        | references  | foreign_key: true |
| user_id        | references  | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user