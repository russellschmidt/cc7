Rails.application.routes.draw do
  resources :donations
  devise_for :admins
  devise_for :donors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :partners, only: [:index, :show]

  resources :locations, only: [:index, :show] do
    authenticate :admin do
      resources :projects, only: [:new, :create, :edit, :update, :destroy] do
        resources :campaigns, only: [:new, :create, :edit, :update, :destroy]
      end
    end

    resources :projects, only: [:index, :show] do
      resources :campaigns, only: [:index, :show]
    end
  end

  authenticate :admin do
    resources :locations, only: [:new, :create, :edit, :update, :destroy]
    resources :partners, only: [:new, :create, :edit, :update, :destroy]
  end

  # start polymorphic address/addressableassociations
  resources :partners do
    resources :addresses, only: [:new, :create, :edit, :update]
  end

  resources :projects do
    resources :addresses, only: [:new, :create, :edit, :update]
  end

  resources :donors do
    resources :addresses, only: [:new, :create, :edit, :update]
  end

  resources :admins do
    resources :addresses, only: [:new, :create, :edit, :update]
  end
  # end polymorphic address/addressable associations
end
