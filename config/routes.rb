Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about'
  
  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :edit]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
