# README
 

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| first_name         | string             | null: false             |
| last_name          | text               | null: false             |
| birth_date         | text                | null: false             |


### Association

* has_many :syohins
* has_many :　

## syohins table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| image                               | string     | null: false       |
| syohinname                          | text       | null: false       |
| setumei                             | text       | null: false       |
| kategore                            | references | foreign_key: true |
| jyoutai                             | string     | null: false       |
| haisoryou                           | text       | null: false       |
| area                                | text       | null: false       |
| days                                | references | foreign_key: true |
| kakaku                              | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## records table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| syohin      | text       | null: false       |
| kounyusya   | references | foreign_key: true |


### Association

- belongs_to :prototype
- belongs_to :user

##  haisos table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| yubinnum                            | string     | null: false       |
| totodohuken                         | text       | null: false       |
| sityouson                           | text       | null: false       |
| banti                               | references | foreign_key: true |
| tatemonomei                         | string     | null: false       |
| denwanum                            | text       | null: false       |


### Association