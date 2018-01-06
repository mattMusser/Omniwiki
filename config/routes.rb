Rails.application.routes.draw do
  
  resources :wikis

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  resources :charges,  only: [:new, :create, :destroy]

  get '/charges', to: 'charges#destroy', as: :downgrade

  devise_for :users

  get 'about' => 'welcome#about'
  root 'welcome#index'
end
