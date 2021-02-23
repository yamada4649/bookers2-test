Rails.application.routes.draw do
  devise_for :a_admins
  devise_for :admins
  devise_for :users
  get 'home/about'
  root :to => 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'users#top'
  get 'about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books
end
