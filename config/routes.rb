Rails.application.routes.draw do
  devise_for :users
  resources :user ,only: [:update]
  resources :lists
  root to: 'lists#index'
  delete '/select_delete', to: 'lists#select_delete', as: 'select_delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
