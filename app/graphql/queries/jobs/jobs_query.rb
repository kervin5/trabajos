module Queries
  module Jobs
    class JobsQuery < BaseQuery
      type [Types::JobType], null: false #, description: "Returns a list of jobs"

      def resolve
        Job.preload(:user).all
      end
    end
  end
end
