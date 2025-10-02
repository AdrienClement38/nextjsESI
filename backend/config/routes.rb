Rails.application.routes.draw do
  get '/health', to: 'health#index'

  namespace :api do
    resources :users, only: [:index, :show]
    resources :posts, only: [:index, :show]
  end
end
