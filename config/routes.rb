Rails.application.routes.draw do
  devise_for :users,  skip: [:session, :password, :registration, :configuration], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  scope "(:locale)", locale: /ru|en/ do 
    devise_for :users,  skip: :omniauth_callbacks
    get 'userlist/index'
    resources :tags
    resources :colls
    resources :colls do
      resources :items
    end
    resources :colls do
      resources :dops
    end
    resources :items do
      #post 'comments', to: 'comments#create'
      resources :comments, only: [:create, :destroy] 
    end

      resources :dops do
        resources :dopplaces
  end
    resources :colls do
      member do
        put "like" => "colls#upvote"
        put "unlike" => "colls#downvote"
      end
    end
    delete " /users(.:format)", to: "devise/registrations#update" , as: :user_path
    delete "/%20/users(.:format)", to: "users#index" , as: :users_path_path
    put "/users/:id(.:format)", to: "users#update", as: :update_users


    root to: "home#index"
    get	'/colls/:coll_id/items/:id(.:format)', to: "items#show", as: :coll_item_path
    get '/colls/:coll_id/dops/:id(.:format)', to: "dops#show", as: :coll_dop_path


    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :users
    get 'users/:id' => 'users#show'
  end
end
