module Mutations
  module Messages
    class ReplyToMessageMutation < Mutations::BaseMutation
      argument :message_id, ID, required: true
      argument :body, String, required: true
      field :message, Types::Messages::MessageType, null: true
      # field :errors, Types::ValidationErrorsType, null: true

      def resolve(message_id:, body:)
        original_message = Message.find(message_id)
        sender = current_user
        topic = "#{original_message.topic}"
        result = sender.reply_to(original_message, topic, body)

        if result
          #   TrabajosSchema.subscriptions.trigger(
          #     "messageSent",
          #     {},
          #     { status: "newMessage" + Time.now.to_s },
          #     scope: recipient.id
          #   )
          { message: result }
        else
          { errors: result.errors }
        end
      end

      #   def authorized?(args)
      #     authorize!(:job, :like?)
      #   end
    end
  end
end
