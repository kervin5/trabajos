module LocationsService
  class Locations
    def self.find_or_create_location_by_name(name)
      existing_location = Location.find_by(name: name)

      location =
        if existing_location
          existing_location
        else
          location_by_name = ::GeolocationService::Geocoding.forward(name).first
          existing_location =
            Location.find_by(name: location_by_name[:name]) ||
              Location.create!(location_by_name.to_h.except(:id))
        end
    end
  end
end
