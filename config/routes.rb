Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  
  root 'static_pages#home'
  get  'week-menu' => 'static_pages#week_menu'

  devise_for :users, :controllers => { registrations: 'registrations',
    omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:show]

  resources :orders, except: [:new]

end
