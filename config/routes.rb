Twitter::Application.routes.draw do
  resources :messages

  get "activities/index"
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :tweets

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

resources :users do
  member do
    get :follow
    get :unfollow
  end
end
  
end