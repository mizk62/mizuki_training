Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  resources :posts, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
  end

  root 'posts#index'
end
