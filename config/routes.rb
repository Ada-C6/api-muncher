Rails.application.routes.draw do
  root to: 'homepage#index'

  resources :homepages, only: [:index, :show]

  get 'homepage/index'
  get 'homepage/show'
  get 'homepage/list'


end
