module Queries
  module Jobs
    class JobsQuery < BaseQuery
      type Types::Jobs::JobType.connection_type, null: false #, description: "Returns a list of jobs"
      argument :filter, Types::Jobs::JobsFilterInput, required: false

      def resolve(filter: nil)
        JobsService::Jobs.find_many(
          location_name: filter&.location_name,
          search_string: filter&.search_string
        )
      end
    end
  end
end
