module Queries
  module Jobs
    class JobQuery < BaseQuery
      type Types::Jobs::JobType, null: true

      argument :id, ID, required: true

      def resolve(id:)
        ::JobsService::Jobs.find_by_id(id)
      end
    end
  end
end
