Rails.application.routes.draw do

  match '/*path' => 'application#options', :via => :options

  namespace :api do
    namespace :v1 do
      resources :accounts, defaults: {format: :json}
      resources :users, except: [:new, :edit], defaults: {format: :json}
      resources :api_keys, only: [:create, :destroy, :index], defaults: {format: :json} do
        member do
          post "refresh"
        end
      end
    end
  end

  root to: "dashboard#index"

  get "dashboard/index"
  get "debug/index"


end
