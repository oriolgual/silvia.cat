Silvia::Application.routes.draw do
  root to: 'illustrations#index'

  resources :illustrations, only: [:index, :show]

  namespace :backend do
    root to: 'illustrations#index'
    resources :illustrations
    resources :tags
    resources :videos
  end
end
