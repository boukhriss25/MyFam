Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  resources :subscriptions, only: [:destroy]
  resources :documents, only: :show
  resources :families do
    post "send_media", to: "conversations#send_media_to_conversation"
    resources :conversations do
      resources :subscriptions, only: [:index, :new, :create]
      resources :messages, only: [:index, :new]
      resources :shares, only: [:index, :new, :create]
    end
    get 'home_media', to: "pages#media_home"
    resources :memberships, only: [:new, :create]
    resources :documents, only: [:new, :create, :index, :show] do
      collection do
        get "tags", to: 'tags#index'
      end
      resources :tags, only: [:show, :new, :create]
      resources :folders
    end
    resources :messages, only: [:create]
    resources :notes, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :collaborations, only: [:index, :new, :create]
    end
  end
  resources :memberships, only: [:destroy]
  resources :tags, only: [:destroy]
  resources :documents, only: [:edit, :update, :destroy]
  resources :shares, only: [:destroy]
  # resources :notes, only: [:destroy]
  resources :collaborations, only: [:destroy]


  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
