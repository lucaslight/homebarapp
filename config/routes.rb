Rails.application.routes.draw do
  root to: 'pages#home'
  resources :pages, only: [:uikit]
  resources :cabinets, only: [:create, :update]
  resources :cocktails, only: [:show, :index]
  resources :saved_cocktails, only: [:create, :index]


  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # get '/uikit', to: 'pages#uikit'
  # get 'cabinets/create'
  # get 'cabinets/update'
  # get 'saved_cocktails/create'
  # get 'saved_cocktails/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
