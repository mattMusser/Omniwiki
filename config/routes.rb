Rails.application.routes.draw do

  get 'downgrade/new'

  get 'downgrade/create'

  resources :topics do
    resources :wikis, except: [:index]
  end

  resources :wikis

  resources :charges, only: [:new, :create]

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
