Rails.application.routes.draw do
  get 'projects/index'
  devise_for :users
  resources :clients do 
    resources :projects do
      resources :comments
    end
  end

  root 'clients#index' 
end
