Commoncore::Application.routes.draw do
  resources :rcategories


  resources :assessments


  devise_for :students
  resources :students

  resources :xaquestions do
    put :select_aquestions, on: :member
    put :unselect_aquestions, on: :member
    put :add, on: :member
  end


  resources :xquestions do
    put :select_questions, on: :member
    put :unselect_questions, on: :member
    put :add, on: :member
    collection { post :sort }
  end

  resources :xvocabs do
    put :select_vocabs, on: :member
    put :unselect_vocabs, on: :member
    put :add, on: :member
  end

  resources :xlinks do
    put :select_links, on: :member
    put :unselect_links, on: :member
    put :add, on: :member
  end

  resources :xstrategies do
    put :select_strategies, on: :member
    put :unselect_strategies, on: :member
  end

  resources :xskills do
    put :select_skills, on: :member
    put :unselect_skills, on: :member
    put :add, on: :member
  end

  resources :lesson_resources


  devise_for :users, :path => '', :path_names => { :sign_up => "register", :sign_in => 'login', :sign_out => 'logout', :account_update => "update_account" }

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


  resources :books do 
    collection do
      get :show_sources
      get :show2
      get :hide
      get :grade
      get :show_list
    end
  end


  resources :links


  resources :vocabs


  resources :strategies


  resources :questions


  resources :clinks


  resources :cstrategies


  resources :cvocabs

  resources :cskills
  resources :skills
  resources :caquestions
  scope "selects/:select_id" do
    resources :lesson_steps do
      get :hide
    end
  end


  root to: 'static_pages#home'
  
  resources :selects do
    resources :assessments
    resources :cquestions
    resources :cskills
    resources :cvocabs
    resources :cstrategies
    resources :clinks
    resources :caquestions
    resources :lesson_resources
    member do
      get 'post_questions'
      put 'post_qs'
      get 'post_aquestions'
      put 'post_aqs'
      get 'post_skills'
      put 'post_ss'
      get 'post_links'
      put 'post_ls'
      get 'post_vocabs'
      put 'post_vs'
    end
  end
  
  resources :cquestions

  resources :users do
    resources :students
  end

  
  
  resources :standards do
    collection do
      get :hide
    end
  end

  match 'lessons',  to: 'selects#index'
  match 'lesson',  to: 'selects#edit'

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
