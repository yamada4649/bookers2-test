Rails.application.routes.draw do
  root :to => 'users#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'users#top'
  resources :users, only: [:index, :show, :edit, :update] do
    resources :books, only: [:new, :index, :create, :show, :edit, :destroy]
  end
end
