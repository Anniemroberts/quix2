class Idea < ApplicationRecord
  has_many :reviews, lambda { order(created_at: :desc) }, dependent: :destroy
  belongs_to :user

  validates(:title, { presence: { message: 'must be given!' },
                    uniqueness: true })
end
