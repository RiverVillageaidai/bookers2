Rails.application.routes.draw do
  # Devise のルートが干渉するので　この記述は一番上に書く
  devise_for :users
  
  root to: 'homes#top'
  get 'homes/about'

  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :edit]

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
