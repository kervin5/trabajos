module Mutations
  module Jobs
    class UpdateJobMutation < Mutations::BaseMutation
      argument :job_id, ID, required: true
      argument :data, Types::Jobs::UpdateJobInput, required: true

      field :job, Types::Jobs::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(job_id:, data:)
        job = Job.find(job_id)

        if job.update_with_data(data)
          TrabajosSchema.subscriptions.trigger("jobUpdated", {}, job)
          { job: job }
        else
          { errors: job.errors }
        end
      end

      def authorized?(args)
        authorize!(:job, :update?)
      end
    end
  end
end
