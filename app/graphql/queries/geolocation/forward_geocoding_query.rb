module Queries
  module Geolocation
    class ForwardGeocodingQuery < BaseQuery
      type [Types::Geolocation::FeatureType], null: false #, description: "Returns a list of jobs"
      argument :filter,
               Types::Geolocation::ForwardGeocodingInput,
               required: true

      def resolve(filter:)
        GeolocationService::Geocoding.forward(
          filter[:location_name],
          filter: filter[:limit]
        )
      end
    end
  end
end
