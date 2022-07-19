module Types
  module Jobs
    class JobsFilterInput < Types::BaseInputObject
      description "Attributes to fitler jobs"
      argument :search_string, String, required: false
      argument :location_name, String, required: false
    end
  end
end
