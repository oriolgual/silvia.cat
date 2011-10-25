Silvia::Application.routes.draw do
  root to: 'illustrations#index'

  resources :illustrations, only: [:index, :show]
  resources :categories, only: [:show]

  resource :contact_form, as: :contact, only: [:new, :create]

  namespace :backend do
    root to: 'illustrations#index'
    resources :illustrations
    resources :categories
    resources :videos
  end
end
