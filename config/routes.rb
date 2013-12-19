Twitter::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :tweets

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end