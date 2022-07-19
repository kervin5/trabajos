# frozen_string_literal: true

module Types
  module Users
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :first_name, String
      field :last_name, String
      field :email, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :display_name, String, null: false

      def display_name
        [object.first_name, object.last_name].compact.join(" ")
      end
    end
  end
end
