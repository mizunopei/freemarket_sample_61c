class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true, length:{maximum: 40}
  validates :introduction, presence: true, length:{maximum: 1000}
  validates :condition, presence: true
  validates :d_burden, presence: true
  validates :d_way, presence: true
  validates :prefecture_id, presence: true
  validates :d_date, presence: true
  validates :price, numericality:{only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"300〜9,999,999の値で入力してください" }

end
