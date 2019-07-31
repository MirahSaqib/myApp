Rails.application.routes.draw do
  # get 'registrations/create'

  devise_for :admins, controllers: { registrations: 'registrations', sessions: 'sessions/sessions' }
  # get 'pages/show', constraints: {subdomain: /.+/}
  devise_for :doctors
  devise_for :patients

  get 'help' => 'pages#help'

  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'

  get 'page_not_found' => 'pages#page_not_found'

  get 'give_email' => 'pages#give_email'

  post 'show_hospitals' => 'pages#show_hospitals'

  post 'update_subdomain' => 'pages#update_subdomain'

  post 'get_user_medicines' => 'pages#get_user_medicines'

  post 'add_medicine' => 'prescriptions#on_add_medicine'

  post 'delete_medicine' => 'prescriptions#on_delete_medicine'

  root 'pages#home'

  get 'admin_dashboard' => 'admins#dashboard'

  resources :prescriptions
  resources :medicines do
    member do
      get 'expire'
    end
  end

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
