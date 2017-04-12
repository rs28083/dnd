Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :char_create
  resources :user
  
  resources :register do
  post :login
end
  
  root 'welcome#index'
end
