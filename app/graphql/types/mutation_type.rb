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
    field :reply_to_message,
          mutation: Mutations::Messages::ReplyToMessageMutation
    field :mark_message_as_read,
          mutation: Mutations::Messages::MarkMessageAsReadMutation
    field :mark_message_as_unread,
          mutation: Mutations::Messages::MarkMessageAsUnreadMutation
    field :add_label_to_message,
          mutation: Mutations::Messages::AddLabelToMessageMutation
    field :remove_label_from_message,
          mutation: Mutations::Messages::RemoveLabelFromMessageMutation
    field :delete_message, mutation: Mutations::Messages::DeleteMessageMutation
  end
end
