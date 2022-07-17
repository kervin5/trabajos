module Mutations
  module Jobs
    class UpdateJobMutation < Mutations::BaseMutation
      argument :id, ID, required: true
      description "Attributes for updating an item"

      field :job, Types::JobType, null: true
      field :errors, Types::ValidationErrorsType, null: true

      def resolve(id:, title:, description: nil)
        check_authentication!

        job = Job.find(id)

        if job.update(attributes.to_h)
          TrabajosSchema.subscriptions.trigger("jobUpdated", {}, job)
          { job: job }
        else
          { errors: job.errors }
        end
      end
    end
  end
end
