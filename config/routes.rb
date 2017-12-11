Rails.application.routes.draw do
  devise_for :users
  root "questions#index"

  resources :questions do
    resources :answers
  end
  
  resources :users

  namespace :api do
    namespace :v1 do
      resources :questions, only: [:index, :show]
    end
  end
end
