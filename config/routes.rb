# frozen_string_literal: true

Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  get 'inquiry/index'
  post 'inquiry/confirm'
  post 'inquiry/thanks'
  get '/search', to: 'searches#search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :ramens, only: %i[new create index show destroy] do
    resource :favorites, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
  end
  resources :users, only: %i[show edit update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
