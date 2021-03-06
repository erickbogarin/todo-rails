Rails.application.routes.draw do
  
  get 'todos' => 'todos#index'

  scope "api" do
    resources :todos,  only: [:index, :new, :create, :destroy, :show, :update]
  end


  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :users

  root 'main#index'

  get '*path' => 'todos#index'
end
