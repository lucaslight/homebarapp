Rails.application.routes.draw do
  get 'pages/uikit'
  get 'cabinets/create'
  get 'cabinets/update'
  get 'saved_cocktails/create'
  get 'saved_cocktails/index'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"

  resources :cocktails, only: [:show, :index]

  get '/uikit', to: 'pages#uikit'
end
