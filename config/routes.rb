Silvia::Application.routes.draw do

  resources :videos, only: :index

  resource :contact_form, as: :contact, only: [:new, :create]

  namespace :backend do
    root to: 'illustrations#index'
    resources :illustrations
    resources :categories
    resources :videos
  end

  get '/resumee', to: redirect('https://s3-eu-west-1.amazonaws.com/silvia.cat/silvia_brujas_resumee.pdf')
  get '/resume', to: redirect('https://s3-eu-west-1.amazonaws.com/silvia.cat/silvia_brujas_resumee.pdf'), as: 'cv_en'
  get '/curriculum', to: redirect('https://s3-eu-west-1.amazonaws.com/silvia.cat/cv_silvia_brujas.pdf'), as: 'cv_es'
  get '/curriculum_catala', to: redirect('https://s3-eu-west-1.amazonaws.com/silvia.cat/cv_silvia_brujas_catala.pdf'), as: 'cv_catala'

  get 'pages/:id', to: 'high_voltage/pages#show', as: 'page'

  get '/illustrations/category/:category_id', to: redirect('/%{category_id}')
  get '/:category_id', to: 'illustrations#index'
  get '/:category_id/:slug', to: 'illustrations#show', as: 'illustration'

  root to: 'illustrations#index'
end
