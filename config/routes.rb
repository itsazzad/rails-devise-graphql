# frozen_string_literal: true

Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  default_url_options host: ENV['DEFAULT_URL']

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
  post '/graphql', to: 'graphql#execute'
  devise_for :users,
             controllers: {
               confirmations: 'auth/confirmations',
               passwords: 'auth/passwords',
               invitations: 'auth/invitations'
             },
             skip: :registrations # skip registration route

  # Just a blank root path
  root 'pages#blank'
end
