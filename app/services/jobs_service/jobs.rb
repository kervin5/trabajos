module JobsService
  class Jobs
    def self.find_by_id(id)
      Job.find_by(id: id)
    end

    def self.find_many(
      location_name: nil,
      search_string: nil,
      status: [::Job::STATUS[:DRAFT]]
    )
      jobs = Job.where(status: status)

      jobs = jobs.search_by_text(search_string) if search_string.present?

      if location_name.present?
        location =
          LocationsService::Locations.find_or_create_location_by_name(
            location_name
          )

        jobs =
          jobs.search_by_location(
            longitude: location.longitude,
            latitude: location.latitude
          )
      end

      jobs
    end
  end
end
