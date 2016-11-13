Rails.application.routes.draw do
  resources :pages, only: [:index, :show]
  root 'pages#search'
end
