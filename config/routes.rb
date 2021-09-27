Rails.application.routes.draw do

  root to: 'pages#home'
  get 'contact', to: 'pages#contact'

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
