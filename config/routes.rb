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
    get 'dashboard', to: "pages#dashboard"
    get 'profile', to: "pages#profile"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
