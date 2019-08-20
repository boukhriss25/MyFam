Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/show'
  get 'tags/new'
  get 'tags/create'
  get 'folders/index'
  get 'folders/show'
  get 'folders/new'
  get 'folders/create'
  get 'folders/edit'
  get 'folders/update'
  get 'folders/destroy'
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
