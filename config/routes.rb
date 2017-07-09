Rails.application.routes.draw do
  
  namespace :admin do
    resources :skills
  end

  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  devise_for :users
  
  resources :users do
    member do
      get 'posts', to: 'pics#user_pics'
    end
    member do
      put 'edit', to: 'users#edit'
    end
    collection do
      get :explore
    end
  end
  
  resources :categories do
    resources :jobs
  end
  
  resources :pics do
    member do
      put 'like', to: 'pics#upvote'
    end
    resources :comments
  end
  root "pics#index"
  
  post ':id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

end
