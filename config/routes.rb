Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :products
  get 'pages/home'

  get 'pages/about'

  get 'pages/private'

  get 'pages/portafolio'

  get 'pages/contact'

  
  root 'pages#home'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
} 


  resources :products do
   member do
    get 'comprar'
   end
  collection do
     get 'execute'
     get 'payments'
     get 'success'
     get 'cancel'
   end
  end

end
