Rails.application.routes.draw do

    root to: 'recipes#index'

    get '/recipes/*uri', format: false,  to:'recipes#show', as: 'show_one'

    resources :recipes, :except => [:show]

    get 'recipes', to: 'recipes#index', as: 'more_results'

end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
