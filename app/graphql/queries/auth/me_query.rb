module Queries
  module Auth
    class MeQuery < BaseQuery
      type Types::Users::UserType, null: true
      description "Get the current user"

      def resolve
        context[:current_user]
      end
    end
  end
end
