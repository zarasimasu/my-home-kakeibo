Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  get "balances" => "balances#index"
  post "balances/show(/:name)" => "balances#show"
  post "balances/show_year(/:name)" => "balances#show_year"

  resources :incomes
  resources :fixedcosts
  resources :variablecosts
end
