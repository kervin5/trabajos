# frozen_string_literal: true

module Types
  module Jobs
    class JobType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :content, JobContentType, null: false
      field :user_id, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :author, Types::Users::UserType, null: false
      field :location, Types::Locations::LocationType, null: false

      def author
        dataloader.with(Sources::ActiveRecord, User).load(object.author_id)
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
    end
  end
end
