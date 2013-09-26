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

  get '/resumee', to: redirect('https://s3-eu-west-1.amazonaws.com/silvia.cat/silvia_brujas_resumee.pdf')
  get '/resume', to: redirect('https://s3-eu-west-1.amazonaws.com/silvia.cat/silvia_brujas_resumee.pdf')
  get '/curriculum', to: redirect('https://s3-eu-west-1.amazonaws.com/silvia.cat/cv_silvia_brujas.pdf')

  root to: 'illustrations#index'
end
