module Types
  module Comments
    class CommentsPaginationInput < Types::BaseInputObject
      description "Paginate comments"

      argument :title, String, "Title of the job", required: true
      argument :content, String, "Content of the job", required: true
      argument :location_name, String, "Location of the job", required: true
      argument :status,
               Types::Jobs::JobStatusType,
               required: false,
               default_value: "draft"
      argument :tags, [String], "Tags", required: false
    end
  end
end
