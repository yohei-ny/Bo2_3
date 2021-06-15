Rails.application.routes.draw do

devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root 'homes#top'
  get "home/about", to: "homes#about"
  get "home/show", to: "homes#show"
  get "search", to: "searchs#index"
  resources :users, only: [:index,:show, :edit, :update] do
  	resources :relationships, only:[:create,:destroy]
     get "follower", to: "relationships#follower"
     get "followed", to: "relationships#followed"
  get "chats/:id", to: "chats#index",as: "chats_room"
  resources :chats,only: [:create,:destroy]
  end
  # resources :user_rooms,only: [:index]
  # get "room_users", to: "user_rooms#index"
end
