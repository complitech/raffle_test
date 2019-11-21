class Raffle < ApplicationRecord
  # Associations
  has_many :user_raffles, dependent: :destroy
  has_many :users, through: :user_raffles

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
