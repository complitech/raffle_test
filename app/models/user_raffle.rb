class UserRaffle < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :raffle

  # Instance methods
  def percentage
    @user_raffles = UserRaffle.where(raffle_id: self.raffle.try(:id))
    if @user_raffles.present?
      percentage = (100.00/@user_raffles.count).to_f.round(2)
    else
      percentage = 100.00
    end
    ("%g" % ("%.2f" % percentage)).to_s + "%"
  end
end
