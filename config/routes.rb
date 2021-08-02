Rails.application.routes.draw do
  get 'projects/index'
  namespace :manager do
    resources :clients
    resources :projects do
      resources :comments
      resources :payments
    end
  end
  devise_for :users
  
  root 'manager/clients#index' 
end
