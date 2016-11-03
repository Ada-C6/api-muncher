Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: [:index]

  resources :recipes, only: [:index, :show]
end
