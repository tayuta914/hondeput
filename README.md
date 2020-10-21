# テーブル設計

## users テーブル

| Column          | Type       | Options                       |
| --------------- | -----------| ----------------------------- |
| username        | string     | null: false                   |
| email           | string     | null: false                   |
| password        | string     | null: false                   |
| profile         | text       | null: false                   |
| profile_image_id| string     | null: false                   |

### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :comments
- has_many :posts

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

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## posts テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| body        | text       | null: false                    |
| impression  | text       | null: false                    |

### Association

- has_many :comments
- belongs_to :user

* ...