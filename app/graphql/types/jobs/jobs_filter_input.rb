module Types
  module Jobs
    class JobsFilterInput < Types::BaseInputObject
      description "Attributes to fitler jobs"
      argument :search, String, required: false
      argument :location_name, String, required: false
      argument :status,
               [Types::Jobs::JobStatusType],
               required: false,
               default_value: ["published"]
      argument :admin, Boolean, required: false, default_value: false
    end
  end
end
