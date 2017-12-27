Rails.application.routes.draw do

  resources :topics do
    resources :wikis, except: [:index]
  end

  resources :wikis, only: [:index]

  resources :charges, only: [:new, :create]

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
