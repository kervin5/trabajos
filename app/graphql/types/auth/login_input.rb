module Types
  module Auth
    class LoginInput < Types::BaseInputObject
      description "Attributes to sign in"

      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
