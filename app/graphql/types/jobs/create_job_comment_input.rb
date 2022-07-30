module Types
  module Jobs
    class CreateJobCommentInput < Types::BaseInputObject
      description "Attributes for creating adding a comment to a job"
      argument :body, String, "Content of the job", required: true
      argument :parent_comment_id,
               ID,
               "Id of the comment the user is replying to",
               required: false
    end
  end
end
