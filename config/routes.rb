Calendar::Application.routes.draw do

  resources :events

  devise_for :users

  root to: 'events#index'
  

end
