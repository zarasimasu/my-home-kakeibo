Rails.application.routes.draw do
  devise_for :users
  match 'users/:id' => 'users#destroy_user', :via => :delete, :as => :user_destroy_user
  resources :users

  root 'top#index'

  get "balances" => "balances#index"
  post "balances/show(/:name)" => "balances#show"
  post "balances/show_year(/:name)" => "balances#show_year"

  resources :incomes
  resources :fixedcosts
  resources :variablecosts
end
