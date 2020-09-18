# frozen_string_literal: true

module Types
  # GraphQL type for a company
  class CompanyType < BaseModel
    field :name, String, null: false
    field :slug, String, null: true
    # field :users, [::Types::UserType], null: true
  end
end