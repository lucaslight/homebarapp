Rails.application.routes.draw do
  get 'pages/uikit'
  get 'cabinets/create'
  get 'cabinets/update'
  get 'saved_cocktails/create'
  get 'saved_cocktails/index'
  get 'cocktails/index'
  get 'cocktails/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"

  get '/uikit', to: 'pages#uikit'
end
