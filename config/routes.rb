Rails.application.routes.draw do
 
  resources :todos
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  root 'main#index'
end
