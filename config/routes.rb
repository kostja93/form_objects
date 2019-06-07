Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'statics#index'
  resources :employee_credit_requests, only: [:index, :new, :create]
  resources :client_names, only: [:new, :create]
  resources :clients, only: [] do
    resources :credit_requests, only: [:new, :create]
  end
end
