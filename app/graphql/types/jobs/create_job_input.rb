module Types
  module Jobs
    class CreateJobInput < Types::BaseInputObject
      description "Attributes for creating a job"

      argument :title, String, "Title of the job", required: true
      argument :content, String, "Content of the job", required: true
      argument :location_name, String, "Location of the job", required: true
      argument :tags, [String], "Tags", required: false
    end
  end
end
