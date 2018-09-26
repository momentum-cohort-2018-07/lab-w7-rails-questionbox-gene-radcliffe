Rails.application.routes.draw do
  # get 'users/signup'
  # get 'users/index'
  # get 'users/show'
  # get 'users/new', to: 'user#new' , as: 'new_user'

  post 'sessions/create'
  get 'sessions/login'
  get 'sessions/destroy'
  get 'questions/question', to: "questions#question"
resources :avatar, only: [:new, :create]
resources :users, only: [:create, :new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome/index'
  get 'questions/destroy', to: "questions#destroy"
  resources :searches
  resources :questions, only: [:show, :new, :edit, :update] do
    resources :answers, only: :new
  end
  
  # namespace :api do
  #   namespace :v1 do
  #       get 'users/login', to: "users#login" 
       
  #       resources :questions, only: :index do
  #         resources :answers, only: :index
  #       end
  #       resources :users, only: [:create, :index] do
  #         resources :answers, only: :index
          
  #         resources :questions, only: [:create, :update, :show] do
  #           resources :answers, only: [:create, :update, :destroy]
  #         end
  #     end
  #   end
  # end


  
  root 'welcome#index'
end
