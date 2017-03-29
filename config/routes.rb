Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :char_create
  
  root 'welcome#index'
end
