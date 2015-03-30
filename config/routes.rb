Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root to: "static_pages#home"

  scope :partner_offers do
    get '/presentation', to: "partner_offers#presentation"
    post '/contact', to: "partner_offers#contact"
  end

  resources :partner_offers


  namespace :api do
    namespace :v1 do
      scope :users do
        get '/', to: "users#index"
        get '/show', to: "users#show"
        get '/current', to: "users#current"
        post '/register-gcm', to: "users#register_gcm"
        post '/register-apple', to: "users#register_apple"
        post '/upload-video', to: "users#upload_video"
      end

      scope :chat do
        get '/rooms', to: "chat#list_rooms"
        get '/messages', to: "chat#list_messages"
        post '/messages', to: "chat#new_message"
      end

      scope :challenges do
        get '/create-challenge', to: "challenges#create_challenge"
        get '/show', to: "challenges#show"
        get '/get-current', to: "challenges#get_current"
        post '/submit-photo', to: "challenges#submit_photo"
      end

      scope :offers do
        get '/show', to: "offers#show"
      end

      resources :locations, only: [:create]
      post '/login', to: "users#login"
      post '/switch-online', to: "users#switch_online"
      post '/logout', to: "users#logout"
      post '/register', to: "users#register"
    end
  end

  devise_for :users, :skip => [:registrations, :password]

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
