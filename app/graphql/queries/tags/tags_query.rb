module Queries
  module Tags
    class TagsQuery < BaseQuery
      type [Types::Tags::TagType], null: false #, description: "Returns a list of jobs"

      def resolve()
        ActsAsTaggableOn::Tag.all
      end
    end
  end
end
