Rails.application.routes.draw do
  get 'userlist/index'
  resources :colls do
    post 'dops', to: 'dops#create'
  end
  resources :colls do
    resources :items
  end
  resources :items do
    post 'comments', to: 'comments#create'
  end
  resources :colls do
    member do
      put "like" => "colls#upvote"
      put "unlike" => "colls#downvote"
    end
  end
  delete " /users(.:format)", to: "devise/registrations#update" , as: :user_path
  delete "/%20/users(.:format)", to: "users#index" , as: :users_path_path
  root to: "home#index"
  get	'/colls/:coll_id/items/:id(.:format)', to: "items#show", as: :coll_item_path

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get 'users/:id' => 'users#show'
end
