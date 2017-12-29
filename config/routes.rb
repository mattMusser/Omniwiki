Rails.application.routes.draw do

  resources :topics do
    resources :wikis, except: [:index]
  end

  resources :wikis

  resources :charges
  resources :downgrade

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
