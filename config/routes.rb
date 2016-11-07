Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homepages#index'

  get 'search' => 'homepages#search', as: 'get_search'
  post 'search' => 'homepages#search', as: 'search'
  get 'show' => 'homepages#show', as: 'show'
end
