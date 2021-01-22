Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'sports/index'
  get 'sports/create'
  get 'sports/edit'
  get 'sports/update'
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :teams do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
  resources :sports
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
