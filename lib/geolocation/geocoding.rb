module Geolocation
  class Geocoding
    def self.forward(name, limit = 10)
      places =
        Mapbox::Geocoder.geocode_forward(name, { limit: limit })[0][
          "features"
        ].presence || []

      places.map do |place|
        {
          id: place["id"],
          name: place["place_name"],
          longitude: place["center"][0],
          latitude: place["center"][1]
        }
      end
    end
  end
end
