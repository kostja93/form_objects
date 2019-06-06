Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'statics#index'
  resources :employee_credit_requests, only: [:index, :new, :create]
end
