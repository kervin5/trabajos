# frozen_string_literal: true

module Types
  module Comments
    class CommentType < Types::BaseObject
      field :id, ID, null: false
      field :body, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :user, Types::Users::UserType, null: false
      field :replies, [self], null: false

      def user
        dataloader.with(Sources::ActiveRecord, User).load(object.user_id)
      end

      def replies
        object.children
      end
    end
  end
end
