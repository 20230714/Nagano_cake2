Rails.application.routes.draw do
  # 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   namespace :admin do
    root to: "homes#top"
    get "about", to: "homes#about"
    resources :items, except: [:destroy]
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
   end

   scope module: :public do
    root to: "homes#top"
    get "about", to: "homes#about"
    resources :items, only: [:index, :show]
    resources :customers
    resources :cart_items

    resources :orders, only: [:new, :create, :index, :show]do
        collection do
          post "confirm"
          get "complete"
        end
      end

    resources :addresses
   end
end
