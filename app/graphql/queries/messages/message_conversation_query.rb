module Queries
  module Messages
    class MessageConversationQuery < BaseQuery
      type [Types::Messages::MessageType], null: true

      argument :message_id, ID, required: true

      def resolve(message_id:)
        ::Message.find(message_id).conversation.reorder("").order(id: :asc)
      end
    end
  end
end

#TODO: Implement message policy
