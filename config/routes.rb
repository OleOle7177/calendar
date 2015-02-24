Calendar::Application.routes.draw do

  resources :events

  root to: 'events#index'
  get '/all', to: 'events#all'

  devise_for :users, :controllers => { :registrations => 'registrations' }   

end
