Rails.application.routes.draw do
  devise_for :users
  get 'weather', to: 'weather#index'
end
