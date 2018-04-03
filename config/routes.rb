Rails.application.routes.draw do

  devise_scope :users do
    authenticated :user do
      root to: 'locations#index'
    end

    unauthenticated do
      root to: 'home#index'
    end
  end

  devise_for :users

  resources :locations
end
