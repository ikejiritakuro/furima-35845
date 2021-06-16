# README
 

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| email              | string              | null: false  unique: true|
| encrypted_password | string              | null: false              |
| first_name         | string              | null: false              |
| last_name          | string              | null: false              |
| birth_date         | date                | null: false              |
| nickname           | string              | null: false              |
| first_name_kana    | string              | null: false              |
| last_name_kana     | string              | null: false              |

### Association

* has_many :items
* has_many :records　

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| description                         | text       | null: false       |
| category_id                         | integer    | null: false       |
| product_status_id                   | integer    | null: false       |
| delivery_charge_id                  | integer    | null: false       |
| area_id                             | integer    | null: false       |
| date_id                             | integer    | null: false       |
| price                               | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## records table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user


##  address table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code                         | string     | null: false       |
| prefectures_id                      | integer    | null: false       |
| municipality                        | string     | null: false       |
| address                             | string     | null: false       |
| building                            | string     |                   |
| phone_number                        | string     | null: false       |
| record                              | references | foreign_key: true | 

### Association

- belongs_to :record