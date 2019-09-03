Rails.application.routes.draw do

  resources :users, only: [:show]

  resources :posts do
    patch :toggle_status
  end

  devise_for :users

  root 'pages#home'
end
