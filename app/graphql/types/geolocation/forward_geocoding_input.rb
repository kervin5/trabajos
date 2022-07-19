module Types
  module Geolocation
    class ForwardGeocodingInput < Types::BaseInputObject
      description "Attributes to search locations from external service"

      argument :location_name, String, required: true
      argument :limit, Integer, required: false, default_value: 10
    end
  end
end
