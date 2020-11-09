Rails.application.routes.draw do
  get 'feedback/new'
  get 'feedback/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tests#index'

  devise_for :users

  resources :tests, only: [:index] do
    resources :questions, except: [:index, :show], shallow: true do
      resources :answers, except: [:index, :show], shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
    post :gist, on: :member
  end

  resources :feedbacks, only: [:new, :create]

  resources :badges, only: [:index]

  namespace :admin do
    resources :tests, except: [:show, :update] do
      patch :update_inline, on: :member

      resources :questions, except: [:index, :show], shallow: true do
        resources :answers, except: [:index, :show], shallow: true
      end
    end

    resources :gists, only: [:index]

    resources :badges
  end
end
