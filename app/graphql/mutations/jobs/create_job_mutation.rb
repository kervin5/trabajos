module Mutations
  module Jobs
    class CreateJobMutation < Mutations::BaseMutation
      argument :data, Types::Jobs::CreateJobInput, required: true

      field :job, Types::Jobs::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(data:)
        job = Job.create_with_user(data, current_user)

        if job
          TrabajosSchema.subscriptions.trigger("jobCreated", {}, job)
          { job: job }
        else
          { errors: job.errors } # change here
        end
      end

      def authorized?(args)
        authorize!(:job, :create?)
      end
    end
  end
end
