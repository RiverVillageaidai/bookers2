Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about'
  
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  resources :books, only: [:new, :index, :show, :edit]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
