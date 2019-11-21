class SnsCredential < ApplicationRecord
  validates :uid, presence: true, uniqueness: { message: "既に存在しています" }
  validates :provider, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
