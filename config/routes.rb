Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: 'admins/sessions'
}

  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  devise_for :customers
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :items, only: [:index, :show]
  resources :addresses, except: [:new, :show]
  get '/customers/mypage' => 'customers#show'
  get '/customers/mypage/edit' => 'customers#edit'
  patch '/customers/mypage' => 'customers#update'
  get '/customers/mypage/confirm' => 'customers#confirm'
  patch '/customers/mypage/confirm' => 'customers#quit'
  resources :cart_items, only: [:index, :create, :update]
  delete '/cart_items/:id' => 'cart_items#destroy'
  delete '/cart_items' => 'cart_items#destroy_all'
  resources :orders, only: [:new, :create, :index, :show]
  get '/orders/confirm' => 'orders/confirm'
  post '/orders/confirm' => 'orders/confirm'
  get '/orders/complete' => 'orders/complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
