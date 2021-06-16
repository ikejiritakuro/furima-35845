# README
 

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| email              | string              | null: false  unique: true|
| encrypted_password | string              | null: false              |
| first_name         | string              | null: false              |
| last_name          | string              | null: false              |
| birth_date         | text                | null: false              |


### Association

* has_many :syohins
* has_many :records　

## syohins table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| syohin_name                         | string     | null: false       |
| setumei                             | text       | null: false       |
| category_id                         | integer    | null: false       |
| jyoutai                             | integer    | null: false       |
| haisoryou                           | integer    | null: false       |
| area                                | integer    | null: false       |
| date                                | references | foreign_key: true |
| kakaku                              | string     | null: false       |

### Association

- 
- has_many :records

## records table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| syohin      | text       | null: false       |
| kounyusya   | references | foreign_key: true |


### Association

- has_many :
- has_many :

##  haisos table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| postal_code                         | string     | null: false       |
| prefectures                         | integer    | null: false       |
| municipality                        | text       | null: false       |
| address                             | text       | null: false       |
| tatemono                            | string     |                   |
| phone_number                        | string     | null: false       |


### Association

- belongs_to :records