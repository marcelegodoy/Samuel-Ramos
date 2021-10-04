Rails.application.routes.draw do

  get 'contact', to: 'pages#contact'

  root to: 'projects#index'
  resources :projects, only: [:index, :show]

  devise_for :users

  namespace :guest do
    resources :projects, only: [:index]
    root to: 'projects#index'
  end

  namespace :admin do
    resources :projects
    resources :texts
    resources :tags

    root to: 'projects#index'
  end
end
