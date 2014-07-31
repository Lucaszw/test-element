Lanilabs::Application.routes.draw do
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
    
  get "sidekiq_test" => "sidekiq_test#test_page"
  get "sidekiq_test_request" => "sidekiq_test#getRequest", :as => "getFromSidekiq"
  #get "sidekiq_test/events" => "sidekiq_test#events"
  
  resources :sidekiq_test do 
    collection {get :events}
  end

  get "model_objects/index"
  get "profiles/edit"
  get "home/index"
  get "model_objects/view"
  get "model_objects/test"
  # get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'about/index' => 'about#index', :as => 'about'
#   get  'generator/sendSTL' => ''
  post 'model_objects/model_tile' => 'model_objects#model_tile', :as => 'model_objects_tile' 
  post 'model_objects/canvas' => 'model_objects#canvas', :as => 'model_objects_canvas'
  # match '/3Dcanvas' => 'model_objects#canvas', via: [:get, :post]
  
#   map.connect "thumb/*specs", :controller => "thumb", :action => "index"

  # You can have the root of your site routed with "root"
   root 'home#index'

  # Example of regular route:
     # get 'products/:id' => 'catalog#view'
  
  post 'profiles/checkIfValidated' => 'profiles#checkIfValidated'
  get 'profiles/validation' => 'profiles#validation'
  get 'generator/w_printform' => 'generator#w_printform', :as => 'print_at_uw'
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
