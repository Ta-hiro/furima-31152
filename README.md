# DB 設計

## users table

| Column              | Type             | Options              |
|---------------------|------------------|----------------------|
| nickname            | string           | null: false          |
| email               | string           | null: false          |
| encrypted_password  | string           | null: false          |
| f_name              | string           | null: false          |
| f_name_kana         | string           | null: false          |
| l_name              | string           | null: false          |
| l_name_kana         | string           | null: false          |
| birthday            | date             | null: false          |

### Association
- has_many : items
- has_many : buys


## items table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| product_name                   | string     | null: false       |
| explanation                    | text       | null: false       |
| category_id                    | integer    | null: false       |
| product_status_id              | integer    | null: false       |
| delivery_burden_id             | integer    | null: false       |
| todouhukenn_id                 | integer    | null: false       |
| shipping_period_id             | integer    | null: false       |
| price                          | integer    | null: false       |
| user                           | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy
- belongs_to :category
- belongs_to :product_status
- belongs_to :delivery_burden
- belongs_to :todouhukenn
- belongs_to :shipping_period


## buys table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| item           | references  | foreign_key: true |
| user           | references  | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addresses table

| Column          | Type        | Options           |
|-----------------|-------------|-------------------|
| todouhukenn_id  | integer     | null: false       |
| postal_code     | string      | null: false       |
| phone_number    | string      | null: false       |
| sityousonn      | string      | null: false       |
| bannti          | string      | null: false       |
| tatemono        | string      |                   |
| buy             | references  | foreign_key: true |

### Association
- belongs_to :buy
- belongs_to :todouhukenn_id