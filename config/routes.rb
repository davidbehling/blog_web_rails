Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'home#index'

  resources :blog, only: [:index]
  resources :portfolio, only: [:index]

  resources :posts, except: [:index] do
    resources :comments
  end
end
