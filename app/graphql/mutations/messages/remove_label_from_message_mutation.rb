# @some_user.tag(@some_photo, :with => "paris, normandy", :on => :locations)

module Mutations
  module Messages
    class RemoveLabelFromMessageMutation < Mutations::BaseMutation
      argument :message_id, ID, required: true
      argument :label, Types::Messages::MessageLabelType, required: true
      field :message, Types::Messages::MessageType, null: true
      # field :errors, Types::ValidationErrorsType, null: true

      def resolve(message_id:, label:)
        message = Message.find(message_id)

        owned_label_list = message.all_labels_list - message.label_list
        owned_label_list -= [label]

        current_user.tag(message, with: owned_label_list.join(","), on: :labels)

        result = message.save

        result ? { message: message } : { errors: result.errors }
      end

      #   def authorized?(args)
      #     authorize!(:job, :like?)
      #   end
    end
  end
end
