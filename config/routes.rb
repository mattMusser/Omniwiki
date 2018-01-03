Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  resources :charges

  resources :downgrade

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
