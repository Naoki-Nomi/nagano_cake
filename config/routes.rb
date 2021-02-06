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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
