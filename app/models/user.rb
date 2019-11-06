class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true 
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX }, confirmation: true  
  validates :password_confirmation, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :birth_day, presence: true
  validates :tel, presence: true, uniqueness: true, length: { in: 10..11 }, numericality: { only_integer: true}
   
  has_one :address
  has_many :cards

end
