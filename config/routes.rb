Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  namespace :admin do
    get 'makings/update'
  end

  namespace :admin do
    resources :orders, only: [:edit, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    get 'homes/top'
  end

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :public do
    resources :orders, only:[:new, :confirm, :complete, :create, :index, :show]
  end

  namespace :public do
    resources :cart_items, only: [:index, :update, :update, :destroy, :destroy, :create]
  end

  namespace :public do
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  end

  namespace :public do
    resources :items, only: [:index, :show]
  end

  namespace :public do
    resources :homes, only: [:top, :about]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
