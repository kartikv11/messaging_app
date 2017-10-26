Rails.application.routes.draw do
  resources :user_to_channel_subscriptions
  resources :user_to_channel_subscriptions
  resources :user_to_channel_subscriptions
  resources :message_recipient_channels
  resources :channels
  resources :message_recipient_users
  resources :messages
  resources :users
  get 'get_all_users_for_the_channel' => 'users#get_all_users_for_the_channel'
  get 'get_all_messages_received_by_the_user' => 'users#get_all_messages_received_by_the_user'
  get 'get_all_messages_for_the_channel' => 'messages#get_all_messages_for_the_channel'
  get 'get_all_channels_for_user' => 'users#get_all_channels_for_user'
  get 'get_user_status' => 'users#get_user_status'
  post 'set_message_from_user_to_user' => 'users#set_message_from_user_to_user'
  post 'set_message_from_user_to_channel' => 'users#set_message_from_user_to_channel'
  post 'subscribe_user_to_channel' => 'users#subscribe_user_to_channel'
  post 'unsubscribe_user_from_channel' => 'users#unsubscribe_user_from_channel'
  post 'register_user' => 'users#register_user'
  post 'toggle_user_status' => 'users#toggle_user_status'
  post 'register_channel' => 'channels#register_channel'
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
