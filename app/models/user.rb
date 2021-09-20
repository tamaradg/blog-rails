class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :mail, uniqueness: true, presence: true
end
