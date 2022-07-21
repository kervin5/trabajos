# frozen_string_literal: true

module Types
  module Users
    class RoleType < Types::BaseEnum
      description "Role enum"

      value "admin"
      value "candidate"
      value "employer"
    end
  end
end
