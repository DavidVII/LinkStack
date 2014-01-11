Linkstack::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  match 'about', to: 'pages#about', via: :get

  resources :stacks do
    resources :links
  end

  root 'pages#index'
end
