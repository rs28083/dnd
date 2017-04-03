Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :char_create
  resources :register
  
  root 'welcome#index'
end
