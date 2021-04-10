require 'sidekiq/web'
Rails.application.routes.draw do
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations" 
  }
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :checkouts, only: [] do
    member do
      get :checkout
    end
  end
end
