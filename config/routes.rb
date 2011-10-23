Silvia::Application.routes.draw do
  root to: 'illustrations#index'

  resources :illustrations, only: [:index, :show]
  resources :categories, only: [:show]

  namespace :backend do
    root to: 'illustrations#index'
    resources :illustrations
    resources :categories
    resources :videos
  end
end
