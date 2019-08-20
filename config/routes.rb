Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :families do
    resources :conversations do
      resources :messages, only: [:index, :new, :create]
    end
    resources :documents, only: [:new, :create, :index, :show] do
      resources :tags, only: [:index, :show, :new, :create]
      resources :folders
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
