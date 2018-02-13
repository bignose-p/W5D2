Rails.application.routes.draw do
resources :users 
resource :session 
resources :subs
resources :posts do
  resources :comments, only: [:new]
end
resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
