Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :families do
    resources :conversations
    resources :documents, only: [:new, :create, :index, :show] do
      collection do
        get 'search'
      end
    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
