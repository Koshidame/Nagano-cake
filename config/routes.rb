Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  namespace :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end

  namespace :public do
    resources :items, only: [:index, :show]
  end

  namespace :public do
    resource :customers, only: [:show, :edit, :update]
    get '/orders/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdrawal' => 'customers#withdrawal'
  end

  namespace :public do
    resources :cart_items, only: [:index, :update, :update, :destroy, :create]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  end

  namespace :public do
    resources :orders, only:[:new, :create, :index, :show]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
  end

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end


  namespace :admin do
    get '/' => 'homes#top'
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :orders, only: [:show, :update]
  end

  namespace :admin do
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
