module Queries
  module Jobs
    class PublishedJobsQuery < BaseQuery
      type [Types::Jobs::JobType], null: false #, description: "Returns a list of jobs"

      def resolve()
        JobsService::Jobs.find_many()
      end
    end
  end
end
