module Mutations
  module Jobs
    class CreateJobMutation < Mutations::BaseMutation
      argument :data, Types::Jobs::CreateJobInput, required: true

      field :job, Types::Jobs::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(data:)
        check_authentication!

        job = ::JobsService::Jobs.create_job(data, context[:current_user])

        if job
          TrabajosSchema.subscriptions.trigger("jobCreated", {}, job)
          { job: job }
        else
          { errors: job.errors } # change here
        end
      end
    end
  end
end
