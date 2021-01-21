Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :teams
  resources :users
end
