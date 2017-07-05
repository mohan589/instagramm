Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    member do
      get 'posts', to: 'pics#user_pics'
    end
    
    collection do
      get :explore
    end
  end
  
  resources :pics do
    member do
      put 'like', to: 'pics#upvote'
    end
    resources :comments
  end
  root "pics#index"
  
  # match 'users/explore' => 'users#explore', :via => :get

end
