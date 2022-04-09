Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Defines the root path route ("/")
  root "home#index"

  namespace :api do
    namespace :illuminati do
      get 'data', to: 'data#index'
      post 'data', to: 'data#create'

      get 'powerschedules/:group_name', to: "powerschedule#index"
      get 'groups', to: "powerschedule#groups"
    end

    namespace :slamdunk do
      post 'upvotes', to: "votes#upvote"
      post 'downvotes', to: "votes#downvote"
    end

  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
