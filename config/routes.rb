Rails.application.routes.draw do
  root to: 'recipes#index'

  get '/index' => 'recipes#index'

  get '/list' => 'recipes#list', as: 'list_recipes'

  get '/show/*uri' => 'recipes#show', format: false, as: 'show'


end
