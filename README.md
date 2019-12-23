# freemarket_sample_61c
## 概要
フリーマーケットアプリケーションである「メルカリ」のコピーサイトです。

## リンク、接続先情報など
* http://52.196.114.113/

* ID/PASSWORD(basic認証)
  * ID: admin
  * PASSWORD: mercari61c

* 購入用アカウント
  * email: buy@buyer.com
  * passeord: buyer1234
* カード情報
  * 番号: 4242424242424242
  * 期限: 07/25
  * セキュリティコード: 123
 
* 出品者用アカウント
  * email: sell@seller.com
  * password: seller1234

## 使用技術
* Ruby on Rails/MySQL/JavaScript/AWS

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
|tel|integer|null: false|
### Association
- has_one :address
- has_many :cards
- has_many :sns_credentials
- has_many :items

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|d_last_name|string|null: false|
|d_first_name|string|null: false|
|d_last_name_kana|string|null: false|
|d_first_name_kana|string|null: false|
|postal_code|integer|null: false|
|area|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|building_tel|integer||
|user_id|references|foreign_key: true|
### Association
- belongs_to :user

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|---|
|uid|string|---|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|category_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|d_way|string|null: false|
|d_date|string|null: false|
|d_burden|string|null: false|
|prefecture_id|references|foreign_key: true|
|image|text|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|condition|string|null: false|
### Association
- belongs_to: user
- belongs_to :prefecture_id
- belongs_to :category




## prefectureテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

