module Types
  class MutationType < Types::BaseObject
    class MutationType < Types::BaseObject
      field :sign_in, mutation: Mutations::SignInMutation
      field :create_job, mutation: Mutations::CreatejobMutation
      field :update_job, mutation: Mutations::UpdateJobMutation
    end
  end
end
