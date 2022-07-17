module Mutations
  module Auth
    class RegisterMutation < Mutations::BaseMutation
      type Types::Auth::AuthResponseType, null: true
      argument :data, ::Types::Auth::RegisterInput, required: true

      def resolve(data:)
        user = User.new(data.to_h) # change here

        if user.save
          token = Base64.encode64(user.email)
          { token: token, user: user }
        else
          { errors: user.errors } # change here
        end
      rescue ActiveRecord::RecordNotFound
        raise GraphQL::ExecutionError, "an error occured"
      end
    end
  end
end
