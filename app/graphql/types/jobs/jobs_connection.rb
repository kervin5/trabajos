module Types
  module Jobs
    class JobsConnection < Types::BaseConnection
      field :total_published_count, Integer, null: false
      field :total_draft_count, Integer, null: false
      field :total_expired_count, Integer, null: false
      field :total_archived_count, Integer, null: false

      def total_published_count
        object.items.where(status: Job::STATUS[:PUBLISHED]).size
      end

      def total_draft_count
        object.items.where(status: Job::STATUS[:DRAFT]).size
      end

      def total_expired_count
        object.items.where(status: Job::STATUS[:EXPIRED]).size
      end

      def total_archived_count
        object.items.where(status: Job::STATUS[:ARCHIVED]).size
      end
    end
  end
end
