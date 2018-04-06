Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      post :downgrade
    end
  end

  get 'about' => 'welcome#about'
  root 'welcome#index'
end
