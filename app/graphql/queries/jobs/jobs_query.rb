module Queries
  module Jobs
    class JobsQuery < BaseQuery
      type Types::Jobs::JobType.connection_type, null: false #, description: "Returns a list of jobs"
      argument :filter, Types::Jobs::JobsFilterInput, required: false
      argument :admin, Boolean, required: false, default_value: false

      def resolve(filter: {}, admin: false)
        filter = filter.to_h
        #We're overriding the filter filter when the user is not an admin to only  show published jobs
        if admin
          #When the user is looking at an admin page they can see all jobs that they policy allows
          policy_scope(::JobsQuery.new().call(filter))
        else
          filter = filter.merge(status: [Job::STATUS[:PUBLISHED]])
          #When the user is not looking at an admin page, we only want to show jobs that are published
          ::JobsQuery.new().call(filter)
        end
      end
    end
  end
end
