module Queries
  module Jobs
    class JobQuery < BaseQuery
      type Types::Jobs::JobType, null: true

      argument :job_id, ID, required: true

      def resolve(job_id:)
        ::Job.find(job_id)
      end
    end
  end
end
