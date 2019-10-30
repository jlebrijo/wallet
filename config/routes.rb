Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'wallets#index'

  resources :users, only: %i(new create)
  resources :teams, only: %i(new create)
  resources :stocks, only: %i(new create)
  resources :wallets, only: %i(index new create)
  resources :transactions, only: %i(new create)
end
