Linkstack::Application.routes.draw do
  devise_for :users
  match 'about', to: 'pages#about', via: :get

  resources :stacks, only: [:new, :create, :show, :index, :destroy]

  root 'pages#index'
end
