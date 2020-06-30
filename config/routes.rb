Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tests#index'

  resources :tests, only: [:index, :show] do
    resources :questions, only: [:new, :create, :edit, :update, :destroy], shallow: true
  end
end
