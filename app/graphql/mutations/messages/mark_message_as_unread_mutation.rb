module Mutations
  module Messages
    class MarkMessageAsUnreadMutation < Mutations::BaseMutation
      argument :message_id, ID, required: true
      field :message, Types::Messages::MessageType, null: true
      # field :errors, Types::ValidationErrorsType, null: true

      def resolve(message_id:)
        original_message = Message.find(message_id)

        result = original_message.mark_as_unread

        result ? { message: original_message } : { errors: result.errors }
      end

      #   def authorized?(args)
      #     authorize!(:job, :like?)
      #   end
    end
  end
end
