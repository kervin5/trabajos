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
      field :role, ::Types::Users::RoleType, null: false
      field :messages, Types::Messages::MessageType.connection_type, null: false

      def display_name
        [object.first_name, object.last_name].compact.join(" ")
      end

      #TODO: Restrict access to private messagess. Only self user should be able to access their own messages.
      def messages
        object.messages.unreaded.order(created_at: :desc)
      end
    end
  end
end
