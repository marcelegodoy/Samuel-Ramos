Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  namespace :guest do
    resources :projects, only: [:index]

    root to: 'projects#index'
  end

  namespace :admin do
    resources :projects
    resources :texts, only: %i[:show :edit :update]
    resources :tags, only: [:index]

    root to: 'projects#index'
  end
end
