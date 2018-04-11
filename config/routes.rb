Rails.application.routes.draw do
  resources :wikis
  resources :wikis do
      resources :collaborations, only: [:new, :create, :destroy]
  end
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
