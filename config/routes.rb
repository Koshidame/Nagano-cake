Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root to: 'public/homes#top'

  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
