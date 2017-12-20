Rails.application.routes.draw do
  resources :topics do
    resources :wikis, except: [:index]
  end

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
