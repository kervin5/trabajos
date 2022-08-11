# @some_user.tag(@some_photo, :with => "paris, normandy", :on => :locations)

module Mutations
  module Messages
    class AddLabelToMessageMutation < Mutations::BaseMutation
      argument :message_id, ID, required: true
      argument :label, Types::Messages::MessageLabelType, required: true
      field :message, Types::Messages::MessageType, null: true
      # field :errors, Types::ValidationErrorsType, null: true

      def resolve(message_id:, label:)
        message = Message.find(message_id)
        labels = message.labels_from(current_user) + [label]

        result = current_user.tag(message, with: labels, on: :labels)

        result ? { message: message } : { errors: result.errors }
      end

      #   def authorized?(args)
      #     authorize!(:job, :like?)
      #   end
    end
  end
end
