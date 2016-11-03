Rails.application.routes.draw do
    root 'recipes#index'
    get   '/recipes/next', to: 'recipes#next', as: 'next'

    resources :recipes, only: [:index, :show]



end
