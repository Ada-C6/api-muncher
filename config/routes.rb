Rails.application.routes.draw do
  root to: 'homepages#index'

  resources :homepages, only: [:list]

  get 'homepages/index'
  get 'homepages/list' => 'homepages#list', as: 'list'
  get 'homepages/show/:id' => 'homepages#show', as: 'show'



end
