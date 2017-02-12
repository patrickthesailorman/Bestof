Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :admin
  resources :categories
  get 'home/index'

  devise_for :users
root to: "home#index"

  resources :users

  resources :posts do
    #users do
      put 'vote'

  end
  put 'vote' => 'posts#vote'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
