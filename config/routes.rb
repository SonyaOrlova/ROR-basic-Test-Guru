Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tests#index'

  resources :tests, only: [:index] do
    resources :questions, only: [:index, :show, :new, :create, :destroy], shallow: true
  end
end
