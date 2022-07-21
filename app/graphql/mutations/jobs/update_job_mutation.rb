module Mutations
  module Jobs
    class UpdateJobMutation < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :data, Types::Jobs::UpdateJobInput, required: true

      field :job, Types::Jobs::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(data:)
        check_authentication!

        job = Job.find(id)

        if job.update(data.to_h)
          TrabajosSchema.subscriptions.trigger("jobUpdated", {}, job)
          { job: job }
        else
          { errors: job.errors }
        end
      end
    end
  end
end
