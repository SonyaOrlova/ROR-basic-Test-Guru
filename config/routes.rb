Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tests#index'

  devise_for :users

  resources :tests, only: [:index] do
    resources :questions, except: [:index, :show], shallow: true do
      resources :answers, except: [:index, :show], shallow: true
    end

    post 'start', on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get 'result', on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, except: [:index, :show], shallow: true do
        resources :answers, except: [:index, :show], shallow: true
      end
  end
  end
end
