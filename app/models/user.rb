class User < ApplicationRecord
  # Associations
  has_many :user_raffles, dependent: :destroy
  has_many :raffles, through: :user_raffles

  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
