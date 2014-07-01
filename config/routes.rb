Rails.application.routes.draw do

  resources :accounts

  devise_for :users
  root to: "dashboard#index"

  get "dashboard/index"
  get "debug/index"


end
