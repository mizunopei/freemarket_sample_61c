# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|address_id|references|foreign_key: true|
|profile_id|references|foreign_key: true|
### Association
- has_one :address
- has_one :profile
- has_many :items
- has_many :likes

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|building_tel|integer|null: false|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|introduction|text|---|
|avator|---|---|
|sales|integer|---|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user


## bank_acountsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user

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
|brand_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|like_id|references|foreign_key: true|
|dellivery_fee|integer|null: false|
|delivery_way|string|null: false|
|delivery_date|string|null: false|
|delivery_burden|string|null: false|
|delivery_region_id|references|foreign_key: true|
|image|text|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|size|string|null: false|
|condition|string|null: false|
### Association
- belongs_to: user
- has_many :likes
- has_many :commnets
- belongs_to : brand
- belongs_to :delivery_region
- belongs_to :category


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|---|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## delivery_regionテーブル
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

## dealsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
|user_id|references|foreign_key: true|
|item_id|references_id|foreign_key: true|
|buyer_id|references|foreign_key :true|
### Association
- belongs_to :user
- belongs_to :item
- belongs_to :buyer

## buyerテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user

## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|profit|integer|null: false|
### Association
- has_many :items