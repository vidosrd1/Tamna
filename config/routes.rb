Rails.application.routes.draw do
  resources :cats
  draw :madmin
  resources :tags
  resources :articles
  devise_for :users
  resources :arts
  resources :posts
  resources :lists
  get 'home/index'
  get "up" => "rails/health#show", as: :rails_health_check
  root 'home#index'
  # root "posts#index"
end
