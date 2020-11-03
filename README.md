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
| category_id                    | integer    | null: false       |
| product_status_id              | integer    | null: false       |
| delivery_burden_id             | integer    | null: false       |
| todou_id                       | integer    | null: false       |
| shipping_period_id             | integer    | null: false       |
| price                          | integer    | null: false       |
| user                           | references | foreign_key: true |
| buy                            | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy


## buys table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| item           | references  | foreign_key: true |
| user           | references  | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_oen :address


## addresses table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| todou_id       | integer     | null: false       |
| postal_code    | text        | null: false       |
| phone_number   | text        | null: false       |
| sityousonn     | text        | null: false       |
| bannti         | text        | null: false       |
| tatemono       | text        | null: false       |

### Association
- has_one :buy