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
- has_many :comments
- has_many :posts

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

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