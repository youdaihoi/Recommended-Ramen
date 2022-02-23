Rails.application.routes.draw do
  get 'inquiry/index'
  post 'inquiry/confirm'
  post 'inquiry/thanks'
  get '/search', to: 'searches#search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
   resources :ramens, only: [:new, :create, :index, :show, :destroy] do
     resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]
   end
   resources :users, only: [:show, :edit, :update]
end
