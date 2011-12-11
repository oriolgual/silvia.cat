Silvia::Application.routes.draw do

  resources :illustrations, only: [:index, :show] do
    get '(/category/:category_id)(/page/:page)', action: :index, on: :collection
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
