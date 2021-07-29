Rails.application.routes.draw do
  resources :clients

  root 'clients#index' 
end
