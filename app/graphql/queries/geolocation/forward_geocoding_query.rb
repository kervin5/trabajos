module Queries
  module Geolocation
    class ForwardGeocodingQuery < BaseQuery
      type [Types::Geolocation::FeatureType], null: false #, description: "Returns a list of jobs"
      argument :filter,
               Types::Geolocation::ForwardGeocodingInput,
               required: true

      def resolve(filter:)
        # JobsService::Jobs.find_many(
        #   location_name: filter&.location_name,
        #   search_string: filter&.search_string
        # )
        GeolocationService::Geocoding.forward(
          filter[:location_name],
          filter: filter[:limit]
        )
      end
    end
  end
end
