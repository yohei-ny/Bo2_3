Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root 'homes#top'
get "home/about", to: "homes#about"
get "home/show", to: "homes#show"
  resources :users, only: [:index, :show, :edit, :update]

end
