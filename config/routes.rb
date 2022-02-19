Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'ramens#index'
   resources :ramens, only: [:new, :create, :show, :destroy]
    resources :post_comments, only: [:create, :destroy]
end
