Rails.application.routes.draw do

  devise_for :users
  root to: 'families#index'
  resources :subscriptions, only:[:destroy]
  resources :families do
    resources :conversations do
      resources :subscriptions, only:[:index, :new, :create]
      resources :messages, only: [:index, :new, :create]
    end
    resources :memberships, only: [:new, :create]
    resources :documents, only: [:new, :create, :index, :show] do
      resources :tags, only: [:index, :show, :new, :create]
      resources :folders
    end
  end
  resources :memberships, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
