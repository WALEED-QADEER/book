Rails.application.routes.draw do
  root "dashboard#index"
  devise_for :users 
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  

  resources :books
  resources :authors
  resources :libraries
  # get '/coll', to: 'books#coll', as: 'coll'
  #get '/listauthors', to: 'authors#listauthors'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
