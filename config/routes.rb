Rails.application.routes.draw do

  resources :categories, except: [:show]
  resources :questions  do
    resources :replies
    resources :calls do
      get 'confirm', to: "calls#confirm"
      resources :reviews
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
