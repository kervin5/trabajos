module Mutations
  module Messages
    class DeleteMessageMutation < Mutations::BaseMutation
      argument :message_id, ID, required: true
      field :message, Types::Messages::MessageType, null: true

      # field :errors, Types::ValidationErrorsType, null: true

      def resolve(message_id:)
        message = Message.find(message_id)
        conversation = message.conversation
        result =
          conversation.each { |message| current_user.delete_message(message) }

        result ? { message: message } : { errors: result.errors }
      end

      #TODO: Update permission
      def authorized?(args)
        authorize!(:job, :like?)
      end
    end
  end
end
