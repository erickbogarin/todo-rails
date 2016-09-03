Rails.application.routes.draw do
  
  get 'todos' => 'todos#index'

  scope "api" do
    resources :todos,  only: [:new, :create, :destroy, :show]
  end  
  	
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
  root 'main#index'

  get '*path' => 'todos#index'
end
