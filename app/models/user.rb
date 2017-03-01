class User < ApplicationRecord
  has_many :reviews, lambda { order(created_at: :desc) }, dependent: :destroy
  has_many :ideas, lambda { order(created_at: :desc) }, dependent: :destroy

  has_secure_password

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: true,
                    format: VALID_EMAIL_REGEX

  private

  def downcase_email
    self.email&.downcase!
  end
end
