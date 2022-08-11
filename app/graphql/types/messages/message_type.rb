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
      field :opened_by_sender, Boolean, null: false
      field :sender, Types::Users::UserType, null: false
      field :recipient, Types::Users::UserType, null: false
      field :attachments, [Types::Attachments::AttachmentType], null: false
      field :important, Boolean, null: false
      field :favorite, Boolean, null: false

      def sender
        dataloader.with(Sources::ActiveRecord, User).load(
          object.sent_messageable_id
        )
      end

      def recipient
        dataloader.with(Sources::ActiveRecord, User).load(
          object.received_messageable_id
        )
      end

      def attachments
        []
      end

      def opened
        object.sent_messageable_id == current_user.id || object.opened
      end

      def important
        object.labels_from(current_user).include?("important")
      end

      def favorite
        object.labels_from(current_user).include?("favorite")
      end
    end
  end
end
