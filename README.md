# アプリ名

### MyHome家計簿

# 概要

ユーザー登録すると収入と固定費・変動費が登録できます。<br>登録した収支の情報で月間の収支差と年間の収支差を確認できます。

# 本番環境

https://my-home-kakeibo.herokuapp.com/

ログイン情報（テスト用）

- Eメール : sample@sample.com
- パスワード : hitomi0722

# 制作背景

現在同棲をしていて将来マンションに住みたいという話になりましたが、お互いにお金の管理が上手くできていなかったので、相方にお金の管理を頼みたいと言われたのがキッカケで、家計簿アプリを作ってみようと思い制作しました。

# DEMO

トップページ

(./top.png)


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
