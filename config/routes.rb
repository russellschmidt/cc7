Rails.application.routes.draw do
  devise_for :admins
  devise_for :donors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :locations, only: [:index]
  resources :locations, only: [:show], param: :name
end
