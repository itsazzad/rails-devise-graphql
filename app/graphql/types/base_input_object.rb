# frozen_string_literal: true

module Types
  # Base class for all graphql input objects
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument
  end
end
