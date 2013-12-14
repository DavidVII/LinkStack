Linkstack::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  match 'about', to: 'pages#about', via: :get

  resources :stacks, only: [:new, :create, :show, :index, :destroy]
  resources :links, only: [:new]

  root 'pages#index'
end
