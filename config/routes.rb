Silvia::Application.routes.draw do

  resources :illustrations, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
  end
  resources :categories, only: [:show] do
    get ':id/page/:page', action: :show, on: :collection
  end

  resource :contact_form, as: :contact, only: [:new, :create]

  namespace :backend do
    root to: 'illustrations#index'
    resources :illustrations
    resources :categories
    resources :videos
  end

  root to: 'illustrations#index'
end
