Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :char_create do
    post :del
    get :upd
  end
  resources :user
  
  resources :register do
  post :login
end
  
  root 'welcome#index'
end
