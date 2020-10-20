# アプリ名

### MyHome家計簿


# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |

### Association

- has_many :incomes
- has_many :fixedcosts
- has_many :variablecosts

## incomes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| income_category_id     | integer    | null: false                    |
| value                  | integer    | null: false                    |
| description            | string     |                                |
| year_month             | date       | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## fixedcosts テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| fixedcost_category_id  | integer    | null: false                    |
| value                  | integer    | null: false                    |
| description            | string     |                                |
| year_month             | date       | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## variablecosts テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| variablecost_category_id  | integer    | null: false                    |
| value                     | integer    | null: false                    |
| description               | string     |                                |
| year_month                | date       | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
