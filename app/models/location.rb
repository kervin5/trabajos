class Location < ApplicationRecord
  has_many :jobs

  def self.find_or_create_location_by_name(name)
    return nil if name.size < 1
    existing_location = Location.find_by(name: name)

    location =
      if existing_location
        existing_location
      else
        location_by_name = ::Geolocation::Geocoding.forward(name).first
        existing_location =
          (
            if location_by_name.present?
              (
                Location.find_by(name: location_by_name[:name]) ||
                  Location.create!(location_by_name.to_h.except(:id))
              )
            else
              nil
            end
          )
      end
  end
end
