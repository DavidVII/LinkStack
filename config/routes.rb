Linkstack::Application.routes.draw do
  match 'about', to: 'pages#about', via: :get

  root 'pages#index'
end
