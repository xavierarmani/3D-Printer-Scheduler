Rails.application.routes.draw do
  
  get 'sessions/user' => 'users#index' # if user is admin, it will direct user to users/index page to see user info table
  
  get 'sessions/login' => 'sessions#login'
  
  get 'sessions/admin' => 'sessions#admin_login'
  
  get 'sessions/schedule' => 'schedules#index'
  
  get 'sessions/home' => 'sessions#home'

  get 'sessions/profile' => 'sessions#profile'

  get 'sessions/setting' => 'sessons#setting'

  get 'sessions/new' => 'sessions#new'

  get 'users/index'
  
  get 'schedules/list' => 'schedules#list'
  

  resources :schedules
  resources :machines
  resources :materials
  get    '/login',   to: 'sessions#login'
  post   '/login',   to: 'sessions#login_attempt'
  delete '/logout',  to: 'sessions#destroy'
  
  get    '/admin_login',   to: 'sessions#admin_login'
  post   '/admin_login',   to: 'sessions#admin_login_attempt'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :admins
  resources :users
  
  root 'users#new'
  
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
