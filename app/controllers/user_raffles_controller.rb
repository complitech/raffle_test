class UserRafflesController < ApplicationController
  before_action :get_raffles, only: [:new, :create]

  def new
  end

  def create
    @raffle = Raffle.find_by(id: params[:raffle])
    @user = User.find_or_create_by(email: params[:email])
    @user_raffle = UserRaffle.find_or_initialize_by(user_id: @user.try(:id), raffle_id: @raffle.try(:id))
    notice = 
      if @user_raffle.new_record?
        "Thanks for signing up! Your odds of winning are #{ActionController::Base.helpers.number_to_percentage(@user_raffle.try(:percentage), precision: 2, strip_insignificant_zeros: true)}!"
      else
        "You have already signed up for #{@raffle.try(:name)}. Your odds of winning are #{ActionController::Base.helpers.number_to_percentage(@user_raffle.try(:percentage), precision: 2, strip_insignificant_zeros: true)}!"
      end
    if @user_raffle.save
      redirect_to root_path, notice: notice
    else
      redirect_to root_path, alert: @user_raffle.errors.full_messages.to_sentence
    end
  end

  private

  def get_raffles
    @raffles = Raffle.all
  end
end
