Rails.application.routes.draw do
  root 'welcome#index'

  resources :welcome, only: [:index]

  # resources :recipes, only: [:index, :show]
  resources :recipes, only: [:index]
  get 'recipes/:label', to: 'recipes#show', as: 'recipes_show'

  # get 'recipes/:*uri', to: 'recipes#show', as: 'recipes_show'

end
