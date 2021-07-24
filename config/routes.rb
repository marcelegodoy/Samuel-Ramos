Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  get '/user', to: "admin/projects#index", as: :user_root

  namespace :admin do
    resources :projects, only: [:index]
    resources :texts, only: [:index]
    resources :tags, only: [:index]

    root to: 'projects#index'
  end
end
