class Item < ApplicationRecord

  has_many :likes
  has_many :comments
  
  
  belongs_to :delivery_region
  belongs_to :category
end
