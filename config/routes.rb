Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

  namespace :api do
    namespace :v1 do
        get 'users/login', to: "users#login" 
        resources :users, only: [:create, :index] do
        resources :questions, only: [:create, :index]
      end
    end
  end
end
