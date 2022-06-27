Rails.application.routes.draw do

  devise_for :admins, :controllers => {
     :sessions => 'admins/sessions'
   }
 
   devise_scope :admin do
     get "dashboard", :to => "dashboard#index"
     get "dashboard/login", :to => "admins/sessions#new"
     post "dashboard/login", :to => "admins/sessions#create"
     delete "dashboard/logout", :to => "admins/sessions#destroy"
   end
   
   namespace :dashboard do
     resources :users, only: [:index, :destroy]
     resources :major_categories, except: [:new]
     resources :categories, except: [:new]
     resources :products, except: [:show] do
       collection do
         get  "import/csv", :to => "products#import"
         post "import/csv", :to => "products#import_csv"
         get  "import/csv_download", :to => "products#download_csv"
       end
     end
     resources :orders, only: [:index]
   end
  
  get 'web/index'
  get 'web/show', to: 'web#show'
  get 'users/edit'
  get 'users/update'
  get 'users/mypage'
  devise_for :users
  post '/home/guest_sign_in', to: 'home#guest_sign_in'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:edit, :update] do
  collection do
    get "cart", :to => "shopping_carts#index"
    post "cart/create", :to => "shopping_carts#create"
    delete "cart", :to => "shopping_carts#destroy"
    put "cart_switch_express", :to => "shopping_carts#switch_express"
    get "mypage", :to => "users#mypage"
    get "mypage/edit", :to => "users#edit"
    get "mypage/address/edit", :to => "users#edit_address"
    post "mypage", :to => "users#update"
    get "mypage/edit_password", :to =>"users#edit_password"
    post "mypage/password", :to => "users#update_password"
    get  "mypage/favorite", :to => "users#favorite"
    get "mypage/cart_history", :to => "users#cart_history_index", :as => "mypage_cart_histories"
    get    "mypage/cart_history/:num", :to => "users#cart_history_show", :as => "mypage_cart_history"
  end
end
  
  resources :products do
    member do
      get :favorite
    end
    resources :reviews, only: [:create]
  end
  
  resource :shopping_carts, only: [:index] do
    collection do
      patch :remove_shopping_cart_item
    end
  end
  
end
