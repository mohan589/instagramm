Rails.application.routes.draw do
  devise_for :users
  resources :pics do
    member do
      put 'like', to: 'pics#upvote'
    end
    resources :comments
  end
  root "pics#index"
  
  match 'users/explore' => 'users#explore', :via => :get

end
