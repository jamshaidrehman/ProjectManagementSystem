Rails.application.routes.draw do

  root 'pages#index'
  resources :page

  namespace :admin do
    root 'users#index'

    resources :users do
      member do
        get :activation
      end
    end
  end

  namespace :manager do
    root 'clients#index'
    resources :clients
    resources :projects do
      resources :comments
      resources :payments
    end
  end

  namespace :member do
    root 'member/time_logs#index'
    resources :time_logs
  end

  devise_for :users
end
