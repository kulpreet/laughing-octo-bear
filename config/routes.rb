Todos::Application.routes.draw do
  use_doorkeeper
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :todos

  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end

end
