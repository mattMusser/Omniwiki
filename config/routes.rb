Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  resources :wikis

  resources :charges,  only: [:new, :create, :destroy]


  get '/charges', to: 'charges#destroy', as: :downgrade

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
