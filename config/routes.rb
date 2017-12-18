Rails.application.routes.draw do
  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/create'

  get 'topics/edit'

  get 'topics/update'

  get 'topics/destroy'

  resources :wikis

  devise_for :users
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
