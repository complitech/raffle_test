class UserRafflesController < ApplicationController
  before_action :get_raffles, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_or_create_by!(email: params[:email])
    @raffle = Raffle.find_by(id: params[:raffle])
    if @user.present? && @raffle.present?
      @user_raffle = UserRaffle.find_by(user_id: @user.try(:id), raffle_id: @raffle.try(:id))
      if @user_raffle.present?
        redirect_to root_path, alert: "You have already signed up for #{@raffle.try(:name)}. Your odds of winning are #{@user_raffle.try(:percentage)}!"
      else
        @user_raffle = UserRaffle.new(user_id: @user.try(:id), raffle_id: @raffle.try(:id))
        if @user_raffle.save
          redirect_to root_path, notice: "Thanks for signing up! Your odds of winning are #{@user_raffle.try(:percentage)}!"
        else
          redirect_to root_path, alert: @user_raffle.errors.full_messages.to_sentence
        end
      end
    else
      redirect_to root_path, alert: "Please enter valid email and choose raffle."
    end
  end

  private

  def get_raffles
    @raffles = Raffle.all
  end
end
