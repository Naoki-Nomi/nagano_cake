Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: 'admins/sessions'
}
  namespace :admin do
    root to: 'homes#top'
  end
  
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
