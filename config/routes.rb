Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :users, only: [:show, :index]
  resources :tweets do 
    resources :comments, only: :create
    resource :likes, only: [:create, :destroy]
    collection do 
      get :search
    end
  end
end
