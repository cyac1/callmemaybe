Rails.application.routes.draw do

  resources :categories, except: [:show]
  resources :questions  do
    resources :replies
    resources :calls, only: [:show, :create, :new] do
      get 'confirm', to: "calls#confirm"
    end
  end

  devise_for :users
  get 'dashboard', to: "pages#dashboard"
  get 'profile', to: "pages#profile"


  resources :calls, only: [:index] do
    resources :reviews
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
