module Mutations
  module Jobs
    class CreateJobCommentMutation < Mutations::BaseMutation
      argument :job_id, ID, required: true
      argument :data, Types::Jobs::CreateJobCommentInput, required: true

      field :job, Types::Jobs::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(job_id:, data:)
        job = Job.find(job_id)

        comment = Comment.build_from(job, current_user.id, data[:body])

        comment.save!

        if data[:parent_comment_id].present?
          comment.move_to_child_of(Comment.find(data[:parent_comment_id]))
        end

        if job
          TrabajosSchema.subscriptions.trigger("jobCommentCreated", {}, job)
          { job: job }
        else
          { errors: job.errors } # change here
        end
      end

      # def authorized?(args)
      #   authorize!(:job, :comment?)
      # end
    end
  end
end
