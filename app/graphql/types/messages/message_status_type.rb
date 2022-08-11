# frozen_string_literal: true

module Types
  module Messages
    class MessageStatusType < Types::BaseEnum
      description "Status enum"
      value "unread"
      value "read"
      value "deleted"
    end
  end
end
