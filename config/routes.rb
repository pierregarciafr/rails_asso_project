Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  authenticate :user, lambda { |u| u.admin==true } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [ :index, :show ] do
    member do
      get :following, :followers
    end
  end
  resources :assos, only: [ :index, :show ]
  resources :relationships, only: [ :create, :destroy ]
end
