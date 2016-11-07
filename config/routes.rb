Rails.application.routes.draw do
  root 'recipes#home'
  get '/recipes/:search' => 'recipes#index', as: 'recipes_search'
  get '/recipe/:id' => 'recipes#show', format:false, as: 'recipe'
end
