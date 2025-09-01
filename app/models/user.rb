class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :articles

  validates :username, presence: true, uniqueness: true

end
