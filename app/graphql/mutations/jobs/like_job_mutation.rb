module Mutations
  module Jobs
    class LikeJobMutation < Mutations::BaseMutation
      argument :job_id, ID, required: true

      field :job, Types::Jobs::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(job_id:)
        job = Job.find(job_id)

        if !current_user.liked?(job) && job.liked_by(current_user)
          TrabajosSchema.subscriptions.trigger("jobLiked", {}, job)
          { job: job }
        else
          { errors: job.errors }
        end
      end

      def authorized?(args)
        authorize!(:job, :like?)
      end
    end
  end
end
