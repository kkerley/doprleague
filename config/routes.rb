KkerleyCom::Application.routes.draw do

  resources :stipulations
  resources :trades
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :activities
  
  resources :nfl_teams do 
    collection { post :import }
  end

  resources :super_bowls
  resources :super_bowl_picks

  resources :roster_spots do
    collection { post :sort }
  end

  resources :events
  resources :team_records
  resources :standings
  resources :admin

  resources :players do 
    collection do
      get 'free_agents'
      get 'search'
      post :import
    end
  end

  resources :salary_progressions do 
    collection { post :import }
  end
  
  resources :teams do
    resources :budgets
    resources :draft_rosters
  end
  
  resources :awards
  resources :payouts
  resources :users
  resources :features
  resources :subcontracts

  resources :contracts do
    collection do
      get 'buyouts'
      get 'extensions'
      get 'franchises'
      get 'extended_and_franchised'
      get 'dead_money'
    end
  end

  resources :messages do
    member do
      post :new
    end
  end
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
    collection do
      get :trashbin
      post :empty_trash
    end
  end
  
  root :to => "players#search"
 
  get "signup" => "users#new", :as => "signup"
  get "faqs" => "features#faqs", :as => "faqs"
  get "constitution" => "features#constitution", :as => "constitution"
  get "polls" => "features#polls", :as => "polls"
  get "help" => "features#help", :as => "help"
  get "admin/index" # => "admin/index", :as => "admin"
  get "members" => "users#index", :as => "members"
  get "announcements" => "features#index", :as => "announcements"
  
  devise_scope :user do 
    root to: 'players#search'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end


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
