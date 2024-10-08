Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  
  resources :users do

    resources :posts do
      resources :comments, only: [:create]
    end

    collection do
      get 'profiles'
    end
  end 
end
