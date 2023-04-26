Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :show, :create, :destroy]
      resources :reservations, only: [:index, :create, :destroy]
    end
  end

  resources :users, only: [:create]
  post '/auth/login', to: 'authentication#login'
end
