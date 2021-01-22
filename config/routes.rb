Rails.application.routes.draw do
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

end
