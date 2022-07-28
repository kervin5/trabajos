# frozen_string_literal: true

module Types
  module Jobs
    class JobType < Types::BaseObject
      connection_type_class(Types::Jobs::JobsConnection)
      field :id, ID, null: false
      field :title, String, null: false, description: "Title of the job"
      field :content, JobContentType, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :author, Types::Users::UserType, null: false
      field :location, Types::Locations::LocationType, null: false
      field :source, Types::Jobs::JobSourceType, null: false
      field :status, Types::Jobs::JobStatusType, null: false
      field :tags, [Types::Tags::TagType], null: false
      field :views,
            Integer,
            null: false,
            description: "number of times user has viewed the post"
      field :likes,
            Integer,
            null: false,
            description: "number of likes the job has"
      field :comments,
            Integer,
            null: false,
            description: "number of comments the job has"
      field :shares,
            Integer,
            null: false,
            description: "number of shares the job has"
      field :liked_by_current_user,
            Boolean,
            null: false,
            description: "Has the current user liked the job?"

      def author
        dataloader.with(Sources::ActiveRecord, User).load(object.author_id)
      end

      def views
        10
      end

      def comments
        90
      end

      def likes
        object.get_likes.size
      end

      def shares
        40
      end

      def location
        dataloader.with(Sources::ActiveRecord, Location).load(
          object.location_id
        )
      end

      def content
        {
          html: object.content,
          plainText:
            object
              .content
              .gsub(%r{</?[^>]*>}, "")
              .gsub(/\n\n+/, "\n")
              .gsub(/^\n|\n$/, "")
        }
      end

      def tags
        object.tags
      end

      def liked_by_current_user
        current_user.present? && current_user.liked?(object)
      end
    end
  end
end
