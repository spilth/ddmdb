ActionController::Routing::Routes.draw do |map|
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'
  map.cr '/challenge_ratings/show/:cr', :controller => 'challenge_ratings', :action => 'show'
  map.leaders '/leaders', :controller => 'leaders'

  map.add_favorite "/collection/add_favorite/:id", :controller => "collections", :action => "add_favorite"
  map.remove_favorite "/collection/remove_favorite/:id", :controller => "collections", :action => "remove_favorite"
  map.missing_minis "/collection/missing", :controller => "collections", :action => "missing"
  map.collection '/collection/:id', :controller => "collections", :id => nil
  map.favorites '/favorites/:id', :controller => "favorites", :id => nil

  #map.resource :collection
  map.resource :session, :controller => 'session'
  map.resources :users
  map.resources :comments
  map.resources :miniatures
  map.resources :settings
  map.resources :sources
  map.resources :subtypes
  map.resources :types
  map.resources :rarities
  map.resources :sizes
  map.resources :releases
  map.resources :kinds
  map.resources :origins
  map.resources :difficulties
  map.resources :roles
  map.resources :keywords

  map.root :controller => 'default'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
