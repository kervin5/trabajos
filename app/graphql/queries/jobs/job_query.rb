module Queries
  module Jobs
    class JobQuery < BaseQuery
      type Types::Jobs::JobType, null: true

      argument :job_id, ID, required: true

      def resolve(job_id:)
        ::JobsService::Jobs.find_by_id(job_id)
      end
    end
  end
end
