Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  devise_for :users

  get 'home/about' => "homes#about"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end


  post 'users' => "books#create"
  post 'books' => "books#create"
  post 'users/:id' => "books#create"
  post 'books/:id' => "books#create"
  get 'books/:id/book_comments' => "books#show"


end
