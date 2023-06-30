Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' =>'devise/sessions#destroy'
  end   
  resources :friend_lists
  resources :friends
  #get 'home/index'
  root 'friend_lists#index'
  get 'home/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
