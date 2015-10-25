Rails.application.routes.draw do
  root 'static_pages#home'
  get  'week-menu' => 'static_pages#week_menu'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

end
