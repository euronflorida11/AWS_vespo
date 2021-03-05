Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :teams do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :notifications, only: [:index, :destroy]
  resources :users
  get 'unsubscribe/user' => 'users#unsubscribe', as: 'unsubscribe_user'
  patch ':withdraw/user' => 'users#withdraw', as: 'withdraw_user'
  get 'inquiry/index'
  post 'inquiry/confirm'
  post 'inquiry/thanks'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :sports do
    resource :favorites, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'user/following/:id' => 'users#following', as: 'following'
  get 'user/follower/:id' => 'users#follower', as: 'follower'
  get 'tags/:tag_name' => 'tags#index', as: 'tags'

end
