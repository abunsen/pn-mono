Rails.application.routes.draw do
  resources :invoices
  resources :billing_ledgers
  resources :issued_pass_values
  resources :issued_passes
  resources :pass_template_fields
  resources :pass_templates
  resources :payment_methods
  resources :users
  resources :groups
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static#home"
  get "/about", to: "static#about"
  get "/pricing", to: "static#pricing"
end
