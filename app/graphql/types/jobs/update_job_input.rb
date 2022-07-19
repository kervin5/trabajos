module Types
  module Jobs
    class UpdateJobInput < Types::BaseInputObject
      description "Attributes for updating a job"
      argument :title, String, "Title of the job", required: false
      argument :content, String, "Content of the job", required: false
      argument :location_name, String, "Location of the job", required: false
      argument :tags, [String], "Tags", required: false
    end
  end
end
