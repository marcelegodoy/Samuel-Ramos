Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  namespace :admin do
    resources :projects, only: [:index]
    resources :texts, only: [:index]
    resources :tags, only: [:index]
  end
end
