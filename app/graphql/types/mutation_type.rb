module Types
  class MutationType < Types::BaseObject
    #Jobs
    field :create_job, mutation: Mutations::Jobs::CreateJobMutation
    field :update_job, mutation: Mutations::Jobs::UpdateJobMutation
    field :like_job, mutation: Mutations::Jobs::LikeJobMutation
    field :unlike_job, mutation: Mutations::Jobs::UnlikeJobMutation
    field :create_job_comment_mutation,
          mutation: Mutations::Jobs::CreateJobCommentMutation

    #Messages
    field :send_message_to_job_author,
          mutation: Mutations::Messages::SendMessageToJobAuthorMutation
  end
end
