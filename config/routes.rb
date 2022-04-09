Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Defines the root path route ("/")
  root "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
