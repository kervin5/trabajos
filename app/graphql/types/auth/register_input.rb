module Types
  module Auth
    class RegisterInput < Types::BaseInputObject
      description "Attributes to register"
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
