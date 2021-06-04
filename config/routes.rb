Rails.application.routes.draw do
 
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
    
  resources :relationships, only: %I[create destroy]
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
