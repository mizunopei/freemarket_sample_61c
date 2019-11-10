class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_NUMBER_REGEX = /\A[0-9]+\z/

  validates :d_last_name, presence: true
  validates :d_first_name, presence: true
  validates :d_last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :d_first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :postal_code, presence: true, numericality: {only_integer: true}, length: { is: 7 }
  validates :city, presence: true 
  validates :address, presence: true 
  validates :building_tel, allow_blank: true, numericality: {only_integer: true}, length: { in: 10..11 }

  belongs_to_active_hash :prefecture
  belongs_to :user

end
