RealSite::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'
  devise_for :users
  # devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  resources :users, :only => [:index, :list]
  #   devise_for :users,
  #          :controllers  => {
  #           # :registrations => 'my_devise'
  #           :registrations => 'my_devise/registrations',
  # :edit => 'my_devise/registrations',
  # :new => 'my_devise/registrations',
  # ...
  #          }
  #root :to => 'access#login'
  resources :photos do
    get "new_event_photo", :on => :collection
  end
  resources :comments
  # match '/views/comments/new', :to => 'comments#create'
  # match '/views/comments/delete', :to => 'comments#delete' 
  ## get "comments/create"
  ## get "comments/delete"
  ## resources :events
  resource :event do
  # Route GET /user/admin_login
  get 'new', :on => :collection
end
  
  #   resources :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match ':controller(/:action(/:id(.:format)))'
end
