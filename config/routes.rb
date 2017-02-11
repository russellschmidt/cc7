Rails.application.routes.draw do
  devise_for :admins
  devise_for :donors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  authenticate :admin do
    resources :locations, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :locations, only: [:index, :show]

  authenticate :admin do
    resources :partners, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :partners, only: [:index, :show]

end
