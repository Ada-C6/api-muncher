Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: [:index]

  resources :recipes, only: [:index]
  get 'recipes/:uri', to: 'recipes#show', as: 'recipes_show'
end
