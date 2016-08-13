Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/private'
  root 'pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

end
