Rails.application.routes.draw do
  resources :topics do
    resources :wikis, except: [:index]
  end

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
