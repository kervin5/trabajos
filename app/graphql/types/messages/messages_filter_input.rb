module Types
  module Messages
    class MessagesFilterInput < Types::BaseInputObject
      description "Attributes to fitler jobs"
      argument :search, String, required: false
      argument :status, [Types::Messages::MessageStatusType], required: false
      argument :user_labels,
               [Types::Messages::MessageLabelType],
               required: false
    end
  end
end
