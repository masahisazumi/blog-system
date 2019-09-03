Rails.application.routes.draw do

  resources :posts do
    patch :toggle_status
  end

  devise_for :users

  root 'pages#home'
end
