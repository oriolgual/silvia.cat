Silvia::Application.routes.draw do

  resources :illustrations, only: :index do
    get '(/category/:category_id)(/page/:page)', action: :index, on: :collection
  end
  resources :videos, only: :index

  resource :contact_form, as: :contact, only: [:new, :create]

  namespace :backend do
    root to: 'illustrations#index'
    resources :illustrations
    resources :categories
    resources :videos
  end

  root to: 'illustrations#index'
end
