Rails.application.routes.draw do
  get 'projects/index'
  devise_for :users
  resources :clients do 
    resources :projects
  end

  root 'clients#index' 
end
