Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tests#index'

  match 'signup' => 'users#new', :as => :signup, :via => 'get'
  match 'login' => 'sessions#new', :as => :login, :via => 'get'

  delete :logout, to: 'sessions#destroy'
  
  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests, only: [:index, :show] do
    resources :questions, except: [:index, :show], shallow: true do
      resources :answers, except: [:index, :show], shallow: true
    end

    post 'start', on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get 'result', on: :member
  end
end
