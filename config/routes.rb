Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Defines the root path route ("/")
  root "home#index"

  get 'api/test', action: :index, controller: "api/test"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
