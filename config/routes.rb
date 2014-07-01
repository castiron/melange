Rails.application.routes.draw do

  use_doorkeeper

  match '/*path' => 'application#options', :via => :options

  resources :accounts, defaults: {format: :json}

  devise_for :users, controllers: { sessions: "sessions" }
  root to: "dashboard#index"

  get "dashboard/index"
  get "debug/index"


end
