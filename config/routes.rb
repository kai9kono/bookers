Rails.application.routes.draw do
  root to: 'homes#top'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  patch 'books/:id' => 'books#update', as: 'update_book'
  post 'books/:id/edit' => 'books#edit', as: 'edit_book'
  resources :books
end
