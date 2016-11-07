Rails.application.routes.draw do
  ##the page all users will land on
  #CONTENT
  ##I will need for pop path, to create a short form allowing the user to save recipes to the db
  ##this page will have 1. the nav bar, 2. some images, 3. an index of the first 10 results including [link to show, image, label]
  root 'recipes#index'
  ##this page will have 2. [image, recipe, ingredients, ...link to url/uri]
  get 'recipes/show/:label', to: 'recipes#show', as: 'recipe'
  ##this page will not technically exist, other than as a controller route for the query method
  get 'recipes/search/:w', to: 'recipes#search', as: 'search'
  ##this page serves to populate the index/homepage when the user has not submitted a query or the search has been reset
  get 'recipes/start', to: 'recipes#start', as: 'start'
  ##this page will contain any recipes that the user have checked 'save this recipe'
  get 'recipes/popular', to: 'recipes#popular', as: 'pop'
end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'recipes#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
