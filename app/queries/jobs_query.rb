class JobsQuery
  attr_accessor :initial_scope

  def initialize(initial_scope = Job.all)
    @initial_scope = initial_scope
  end

  def call(scope_filters)
    filters = scope_filters.presence || {}
    scoped = initial_scope
    scoped = status(scoped, filters[:status])
    scoped = location_name(scoped, filters[:location_name])
    scoped = search(scoped, filters[:search])
    scoped
  end

  private

  def status(scoped, status = nil)
    status ? scoped.where(status: status) : scoped
  end

  def location_name(scoped, location_name = nil, radius = 20)
    if location_name
      location = Location.find_or_create_location_by_name(location_name)

      if location.present?
        scoped.joins(:location).where(
          "(earth_box(ll_to_earth(:latitude, :longitude), :distance) @> ll_to_earth(locations.latitude, locations.longitude) AND earth_distance(ll_to_earth (:latitude, :longitude), ll_to_earth (locations.latitude, locations.longitude)) < :distance)",
          {
            latitude: location.latitude,
            longitude: location.longitude,
            distance: radius * 1000
          }
        )
      else
        scoped
      end
    else
      scoped
    end
  end

  def search(scoped, search_string = nil)
    if search_string && search_string.size > 0
      scoped.by_text(search_string)
    else
      scoped
    end
  end
end
