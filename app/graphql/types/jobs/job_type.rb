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
            description: "number of times user has viewed your post"

      def author
        dataloader.with(Sources::ActiveRecord, User).load(object.author_id)
      end

      def views
        10
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
    end
  end
end
