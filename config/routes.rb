Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Defines the root path route ("/")
  root "home#index"

  get 'api/illuminati/data', action: :index, controller: "api/illuminati/data"
  post 'api/illuminati/data', action: :create, controller: "api/illuminati/data"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
