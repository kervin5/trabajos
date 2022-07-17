module Types
  class JobAttributes < Types::BaseInputObject
    description "Attributes for creating or updating a job"

    argument :title, String, required: true
    argument :description, String, required: false
  end
end
