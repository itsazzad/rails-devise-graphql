# frozen_string_literal: true

module Types
  # Base class for all graphql objects
  class BaseObject < GraphQL::Schema::Object
    field_class Types::BaseField
  end
end
