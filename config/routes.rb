Rails.application.routes.draw do
  devise_for :users

  resources :locations

  root to: 'home#index'
end
