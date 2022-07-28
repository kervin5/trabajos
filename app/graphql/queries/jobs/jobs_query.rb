module Queries
  module Jobs
    class JobsQuery < BaseQuery
      type Types::Jobs::JobType.connection_type, null: false #, description: "Returns a list of jobs"
      argument :filter, Types::Jobs::JobsFilterInput, required: false
      argument :admin, Boolean, required: false, default_value: false

      def resolve(filter: nil, admin: false)
        if admin
          policy_scope(
            JobsService::Jobs.find_many(
              location_name: filter&.location_name,
              search_string: filter&.search_string,
              status: filter&.status
            )
          )
        else
          JobsService::Jobs.find_many(
            location_name: filter&.location_name,
            search_string: filter&.search_string,
            status: [Job::STATUS[:PUBLISHED]]
          )
        end
      end
    end
  end
end
