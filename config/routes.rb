Commoncore::Application.routes.draw do
  
  resources :headers


  resources :plans


  resources :select_aquestions


  resources :aquestions


  resources :resources


  resources :sources


  resources :select_links


  resources :select_strategies


  resources :select_vocabs


  resources :select_skills


  resources :select_questions


  resources :districts


  resources :lessonplans


  resources :books


  resources :links


  resources :vocabs


  resources :strategies


  resources :questions


  resources :clinks


  resources :cstrategies


  resources :cvocabs

  resources :cskills
  resources :skills

  scope "selects/:select_id" do
    resources :lesson_steps
  end


  root to: 'static_pages#home'
  
  resources :selects do
    resources :cquestions
    resources :cskills
    resources :cvocabs
    resources :cstrategies
    resources :clinks

    collection do
      get :popular_confessions
      get :top_confessions
      get :controversial_confessions
      get :new_confessions
    end
  end
  
  resources :cquestions

  resources :users 

  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :standards 
  match 'lessons',  to: 'selects#index'
  match 'lesson',  to: 'selects#edit'
  match 'signup',  to: 'users#new'
  match 'signin',  to: 'sessions#new'
  match 'signout', to: 'sessions#destroy', via: :delete

  match 'gradek',  to: 'selects#grade0'
  match 'grade1',  to: 'selects#grade1'
  match 'grade2',  to: 'selects#grade2'
  match 'grade3',  to: 'selects#grade3'
  match 'grade4',  to: 'selects#grade4'
  match 'grade5',  to: 'selects#grade5'
  match 'grade6',  to: 'selects#grade6'
  match 'grade7',  to: 'selects#grade7'
  match 'grade8',  to: 'selects#grade8'


  
  match '/home',    to: 'static_pages#home'
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'


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
