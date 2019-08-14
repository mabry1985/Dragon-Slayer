# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'

  resources :users do
    resources :items
  end

  resources :users do
    resources :enemies
  end

  get "/all_items" => "items#all"
  patch "/all_items" => "items#add"
end
