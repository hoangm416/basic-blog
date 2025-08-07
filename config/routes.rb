Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # Health check endpoint for Docker
  get '/health', to: 'health#index'

  # Defines the root path route ("/")
  root "blog_posts#index"
end
