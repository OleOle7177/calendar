Calendar::Application.routes.draw do

  resources :events

  root to: 'events#index'

  devise_for :users, :controllers => { :registrations => 'registrations' }   

end
