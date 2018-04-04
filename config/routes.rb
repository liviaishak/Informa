Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:create]
  devise_for :users
  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'
end
