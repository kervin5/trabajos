# frozen_string_literal: true

module Types
  module Messages
    class MessageType < Types::BaseObject
      field :id, ID, null: false
      field :topic, String
      field :body, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :opened, Boolean, null: false
      field :sender, Types::Users::UserType, null: false
      field :recipient, Types::Users::UserType, null: false

      def sender
        User.find(object.sent_messageable_id)
      end

      def recipient
        User.find(object.received_messageable_id)
      end
    end
  end
end
