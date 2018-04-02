Rails.application.routes.draw do
  get 'charges/create'

  resources :wikis, :charges, only: [:new, :create]

  devise_for :users
  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'
end
