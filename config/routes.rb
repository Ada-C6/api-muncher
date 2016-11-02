Rails.application.routes.draw do
  root to: 'homepages#index'

  resources :homepages, only: [:index, :show]

  get 'homepages/index'
  get 'homepages/show'
  get 'homepages/list'


end
