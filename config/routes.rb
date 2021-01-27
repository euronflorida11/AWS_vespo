Rails.application.routes.draw do
  get 'maps/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :teams do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
  get 'unsubscribe/user' => 'users#unsubscribe', as: 'unsubscribe_user'
  patch ':withdraw/user' => 'users#withdraw', as: 'withdraw_user'

  resources :sports do
    resource :favorites, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end
