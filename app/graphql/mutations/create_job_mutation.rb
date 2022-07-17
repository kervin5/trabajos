module Mutations
  class CreatejobMutation < Mutations::BaseMutation
    argument :attributes, Types::JobAttributes, required: true

    field :job, Types::JobType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(title:, description: nil)
      check_authentication!

      job = Job.new(attributes.to_h.merge(user: context[:current_user])) # change here

      if job.save
        TrabajosSchema.subscriptions.trigger("jobCreated", {}, job)
        { job: job }
      else
        { errors: job.errors } # change here
      end
    end
  end
end
