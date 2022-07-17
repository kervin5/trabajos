module Mutations
  module Auth
    class LoginMutation < Mutations::BaseMutation
      type Types::Auth::AuthResponseType, null: true
      argument :data, ::Types::Auth::LoginInput, required: true

      def resolve(data:)
        user = User.find_by!(email: data.email)

        token = Base64.encode64(user.email)

        { token: token, user: user }
      rescue ActiveRecord::RecordNotFound
        raise GraphQL::ExecutionError, "user not found"
      end
    end
  end
end
