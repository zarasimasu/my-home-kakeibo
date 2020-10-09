Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  get "balances" => "balances#index"
  post "balances/show(/:name)" => "balances#show"

  resources :incomes
  resources :fixedcosts
  resources :variablecosts
  # resources :balances
end
