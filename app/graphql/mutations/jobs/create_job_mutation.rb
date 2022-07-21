module Mutations
  module Jobs
    class CreateJobMutation < Mutations::BaseMutation
      argument :data, Types::Jobs::CreateJobInput, required: true

      field :job, Types::Jobs::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(data:)
        check_authentication!

        job = Job.new(data.to_h.merge(user: context[:current_user])) # change here

        if job.save
          TrabajosSchema.subscriptions.trigger("jobCreated", {}, job)
          { job: job }
        else
          { errors: job.errors } # change here
        end
      end
    end
  end
end
