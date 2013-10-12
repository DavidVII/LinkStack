Linkstack::Application.routes.draw do
  devise_for :users
  match 'about', to: 'pages#about', via: :get

  root 'pages#index'
end
