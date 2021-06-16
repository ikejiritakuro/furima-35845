# README
 

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| email              | string              | null: false  unique: true|
| encrypted_password | string              | null: false              |
| first_name         | string              | null: false              |
| last_name          | string              | null: false              |
| birth_date         | string              | null: false              |
| nickname           | string              | null: false              |
| first_name_kana    | string              | null: false              |
| last_name_kana     | string              | null: false              |

### Association

* has_many :syohins
* has_many :records　

## syohins table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| syohin_name                         | string     | null: false       |
| setumei                             | text       | null: false       |
| category_id                         | integer    | null: false       |
| jyoutai_id                          | integer    | null: false       |
| haisoryou_id                        | integer    | null: false       |
| area_id                             | integer    | null: false       |
| date_id                             | integer    | null: false       |
| kakaku                              | text       | null: false       |

### Association

- belongs_to :user
- has_one :record

## records table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| syohin      | text       | null: false       |
| kounyusya   | references | foreign_key: true |


### Association

- has_one :haisou


##  haisous table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code                         | string     | null: false       |
| prefectures                         | string     | null: false       |
| municipality                        | string     | null: false       |
| address                             | string     | null: false       |
| tatemono                            | string     |                   |
| phone_number                        | string     | null: false       |


### Association

- belongs_to :record