class User < ApplicationRecord
  has_many :comments
  has_many :articles

  validates :username, presence: true, uniqueness: true

  before_create :set_username

  private

  def set_username
    self.username ||= "user-#{SecureRandom.hex(8)}"
  end
end
