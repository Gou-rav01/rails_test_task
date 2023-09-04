Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #     resources :users, only: [:show]
  #     post '/signup', to: 'auth#signup'
  #     post '/login', to: 'auth#login'
  #   end
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'show', to: 'users#show'
      post 'signup', to: 'users#create'
      post 'login', to: 'users#login'
    end
  end
end
