Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  resources :subscriptions, only: [:destroy]
  resources :families do
    post "send_media", to: "conversations#send_media_to_conversation"
    resources :conversations do
      resources :subscriptions, only: [:index, :new, :create]
      resources :messages, only: [:index, :new]
    end
    get 'home_media', to: "pages#media_home"
    resources :memberships, only: [:new, :create]
    resources :documents, only: [:new, :create, :index, :show] do
      resources :tags, only: [:index, :show, :new, :create]
      resources :folders
    end
    resources :messages, only: [:create]
  end
  resources :memberships, only: [:destroy]
  resources :tags, only: [:destroy]
  resources :documents, only: [:edit, :update, :destroy]

  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
