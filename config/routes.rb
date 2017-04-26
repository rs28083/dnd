Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :char_create do
    post :del
    get :upd
    get :list
    get :dice
    get :dice2
  end
  resources :user
  
  resources :register do
  post :login
  post :lout
end
  
  root 'welcome#index'
end
