Silvia::Application.routes.draw do
  root to: 'home#index'
  namespace :backend do
    root to: 'illustrations#index'
    resources :illustrations
    resources :tags
    resources :videos
  end
end
