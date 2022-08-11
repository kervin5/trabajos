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
      field :avatar, String, null: false
      field :messages,
            Types::Messages::MessageType.connection_type,
            null: false do
        argument :filter, Types::Messages::MessagesFilterInput, required: false
      end

      def display_name
        [object.first_name, object.last_name].compact.join(" ")
      end

      #TODO: Restrict access to private messagess. Only self user should be able to access their own messages.
      def messages(filter: nil)
        if (
             filter.present? &&
               (
                 filter[:search].present? || filter[:status].present? ||
                   filter[:user_labels].present?
               )
           )
          res = object.received_messages
          res = object.deleted_messages if filter[:status].present? &&
            filter[:status].include?("deleted")
          res = res.unreaded if filter[:status].present? &&
            filter[:status].include?("unread")
          res = res.by_text(filter[:search]) if filter[:search].present?

          if (filter[:user_labels].present?)
            res =
              res.tagged_with(
                filter[:user_labels],
                on: :labels,
                owned_by: current_user
              )
          end
          res.order(created_at: :desc)
        else
          object.received_messages.conversations #.order(created_at: :desc)
        end
      end

      def avatar
        "https://avatars.dicebear.com/api/big-ears-neutral/#{object.first_name + object.last_name}.svg"
      end
    end
  end
end
