Rails.application.routes.draw do
  get 'charges/create'

  resources :topics do
    resources :wikis, except: [:index]
  end

  resources :charges, only: [:new, :create]

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
