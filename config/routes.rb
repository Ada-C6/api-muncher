Rails.application.routes.draw do

root 'recipes#index'

  #********     RECIPES ROUTES     *********

  get 'recipes/search' => 'recipes#search', as: 'recipes_search'

  get 'recipes' => 'recipes#index', as: 'recipes_index'

  get 'recipes/show/:id' => 'recipes#show', as: 'recipes_show'

  get 'recipes/new'

  get 'recipes/create'

  get 'recipes/edit'

  get 'recipes/update'

  get 'recipes/destroy'

  #********     USERS ROUTES     *********


  get 'users/index' => 'users#index'

  get 'users/show' => 'users#show'

  get 'users/new' => 'users#new'

  post 'users/create' => 'users#create'

  get 'users/edit' => 'users#edit'

  put 'users/update' => 'users#update'

  delete 'users/destroy' => 'users#destroy'

#SESSIONS ROUTES

	resources :sessions


  get "/auth/:provider/callback" => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  #   end
end
