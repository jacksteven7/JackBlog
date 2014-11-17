JackBlog::Application.routes.draw do
  resources :users
  resources :posts
  resources :user_sessions

  get "welcome/index"
  
  match 'login'  => 'user_sessions#new', as: :login
  match 'logout' => 'user_sessions#destroy', as: :logout

  root :to => 'user_sessions#new'

end
