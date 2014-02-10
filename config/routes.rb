KkerleyCom::Application.routes.draw do
  resources :budgets


  resources :team_records


  resources :standings


  resources :players do 
    collection do
      post :import
      get 'free_agents'
    end
  end

  resources :salary_progressions do 
    collection { post :import }
  end
  resources :teams
  resources :awards
  resources :payouts
  resources :users
  resources :sessions  
  resources :features
  resources :contracts do
    collection do
      get 'buyouts'
      get 'extensions'
      get 'franchises'
      get 'extended_and_franchised'
    end
  end

  resources :subcontracts

  
  root :to => "features#index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "faqs" => "features#faqs", :as => "faqs"
  get "constitution" => "features#constitution", :as => "constitution"
  get "polls" => "features#polls", :as => "polls"
  get "admin" => "features#admin", :as => "admin"
  get "members" => "users#index", :as => "members"
  



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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
