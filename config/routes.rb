Rails.application.routes.draw do

  get "post/index"

  resources :posts

  root 'posts#index'
end
