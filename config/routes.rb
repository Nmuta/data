Rails.application.routes.draw do
  resources :responses
  resources :tertiaries
  resources :secondaries
  resources :profiles
  resources :partners
  resources :campuses
  resources :events
  resources :emotions
  resources :users
  resources :tips
  resources :tips
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'


  get 'get_tip' => 'tips#get_tip'
  get 'get_emotions' => 'emotions#get_emotions'
  get 'get_campuses' => 'campuses#get_campuses'
  post 'post_event' => 'events#post_event'
  post 'get_user_history' => 'events#get_user_history'
  post 'get_user' => 'users#get_user'
  post 'post_user' => 'users#post_user'

  get 'bulk_add' => 'emotions#bulk_add'
  post 'bulk_processing' => 'emotions#bulk_processing'

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
