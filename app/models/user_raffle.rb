class UserRaffle < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :raffle

  # Instance methods
  def percentage
    percentage = (100.00/UserRaffle.where(raffle_id: self.raffle.try(:id)).count).round(2)
  end
end
