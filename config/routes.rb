Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "user_raffles#new"
  resources :user_raffles, only: [:new, :create]
end
