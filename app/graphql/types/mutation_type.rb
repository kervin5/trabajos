module Types
  class MutationType < Types::BaseObject
    #Auth
    field :login, mutation: Mutations::Auth::LoginMutation
    field :register, mutation: Mutations::Auth::LoginMutation

    #Jobs
    field :create_job, mutation: Mutations::Jobs::CreateJobMutation
    field :update_job, mutation: Mutations::Jobs::UpdateJobMutation
  end
end
