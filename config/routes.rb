Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :char_create
  resources :register
  resources :user
  
  root 'welcome#index'
end
