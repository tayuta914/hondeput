# テーブル設計

## users テーブル

| Column          | Type       | Options                       |
| --------------- | -----------| ----------------------------- |
| nickname        | string     | null: false                   |
| email           | string     | null: false                   |
| password        | string     | null: false                   |
| first_name      | string     | null: false                   |
| first_name_kana | string     | null: false                   |
| last_name       | string     | null: false                   |
| last_name_kana  | string     | null: false                   |
| birth_date      | date       | null: false                   |
| sex_id          | integer    | null: false                   |


### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :posts
- has_many :comments

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| tittle  | string     | null: false                    |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many: comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       |                                |
| user_id | integer    | null: false                    |
| post_id | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :post
* ...