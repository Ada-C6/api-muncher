Rails.application.routes.draw do

  root 'homepage#index'
  get '/recipes/', to: 'recipes#index', as: 'recipes'
  get '/recipe/:id', to: 'recipes#show', as: 'recipe'
end
