Rails.application.routes.draw do
  get 'charges_controller/create'

  resources :topics do
    resources :wikis, except: [:index]
  end

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
