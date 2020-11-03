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
| prefectures_id                 | integer    | null: false       |
| shipping_period_id             | integer    | null: false       |
| price                          | integer    | null: false       |
| user                           | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy
- belongs_to :category
- belongs_to :product_status
- belongs_to :delivery_burden
- belongs_to :prefectures
- belongs_to :shipping_period


## buys table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| item           | references  | foreign_key: true |
| user           | references  | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :delivery_address


## delivery_addresses table

| Column          | Type        | Options           |
|-----------------|-------------|-------------------|
| prefectures_id  | integer     | null: false       |
| postal_code     | string      | null: false       |
| phone_number    | string      | null: false       |
| municipalities  | string      | null: false       |
| address         | string      | null: false       |
| building_name   | string      |                   |
| buy             | references  | foreign_key: true |

### Association
- belongs_to :buy
- belongs_to :prefectures