# frozen_string_literal: true

module Types
  # Loads queries into schema
  # include other queries and resolvers here
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :me, resolver: Resolvers::Users::Me

    field :users, resolver: Resolvers::Users::Users
    field :user, resolver: Resolvers::Users::User

    field :company, resolver: Resolvers::Companies::Company
  end
end

