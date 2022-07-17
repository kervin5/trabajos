# frozen_string_literal: true

module Types
  module Auth
    class AuthResponseType < Types::BaseObject
      field :token, String, null: true
      field :user, Types::UserType, null: true
    end
  end
end
