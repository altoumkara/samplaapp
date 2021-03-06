Samplaapp::Application.routes.draw do
   resources :users #this is used to retrieve the URL for user and their id(ex:  /users/1)
   resources :sessions, only: [:new, :create, :destroy] # we did this "only" option, Since we have no need to show or edit sessions, we’ve restricted the actions to new, create, and destroy using the :only option accepted by resources.

  #get "static_pages/home"
   root 'static_pages#home' # by making the home root , we will see the home page when we run 'http://localhost:3000/'
   match '/signup', to: 'users#new', via: 'get'
   match '/signin',  to: 'sessions#new', via: 'get'
   match '/signout',  to: 'sessions#destroy', via: 'delete'
#Note the use of via: ’delete’ for the signout route, which indicates that it should be invoked using an HTTP DELETE request.
#Note that the routes for signin and signout are custom, but the route for creating a session is simply the default (i.e., [resource name]_path).
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  #get "static_pages/about"
  #get "static_pages/contacts"
 

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
