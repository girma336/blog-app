Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }, sign_out_via: [:get, :post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

end
