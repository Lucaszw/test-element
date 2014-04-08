Lanilabs::Application.routes.draw do

  get "model_objects/index"
  get "profiles/edit"
  get "home/index"
  get "model_objects/view"
  get "model_objects/test"
  # get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'about/index' => 'about#index', :as => 'about'
  get 'model_objects/canvas' => 'model_objects#canvas', :as => 'model_objects_canvas'
  get 'model_objects/add_to_cart' => 'model_objects#add_to_cart', :as => 'model_objects_add_to_cart'
  # match '/3Dcanvas' => 'model_objects#canvas', via: [:get, :post]


  # You can have the root of your site routed with "root"
   root 'home#index'

  # Example of regular route:
     # get 'products/:id' => 'catalog#view'

  get 'generator/form' => 'generator#form'
  match 'generator/download' => 'generator#download', via: [:get, :post]
  post 'generator/submit' => 'generator#submit'
  
  get 'navbar/logout' => 'navbar#logout'
  get 'model_objects/galleryView' => 'model_objects#galleryView'
  get 'model_objects/single' => 'model_objects#single'
  post 'model_objects/search' => 'model_objects#search' 
  get 'profiles/update' => 'profiles#update' 
  # get 'model_objects' => 'model_objects#categoryList'


   # map.connect ':user_models/:stlfile', :controller => 'userfiles', :action => 'display'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :comments
    resources :navbar
    resources :profiles
    resources :model_objects

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
