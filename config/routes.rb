# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root to: 'games#index'

  resources :users do
    resources :items
  end

  resources :admins do
    resources :items
  end

end
