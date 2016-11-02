Rails.application.routes.draw do
  resources :homepages, only: [:index]
  get '/', to: 'searches#new', as: 'root'

  get '/searches/', to: 'searches#index', as: 'searches'
  post '/searches/', to: 'searches#create', as: 'create_search'
  get '/searches/:id/', to: 'searches#show', as: 'search'

end
