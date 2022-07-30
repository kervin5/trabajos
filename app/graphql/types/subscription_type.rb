module Types
  class SubscriptionType < GraphQL::Schema::Object
    field :job_created,
          Types::Jobs::JobType,
          null: false,
          description: "An job was created"
    field :job_updated,
          Types::Jobs::JobType,
          null: false,
          description: "An job was updated"
    field :job_liked,
          Types::Jobs::JobType,
          null: false,
          description: "An job was liked"
    field :job_unliked,
          Types::Jobs::JobType,
          null: false,
          description: "An job was liked"
    field :job_comment_created,
          Types::Jobs::JobType,
          null: false,
          description: "An job was commented on"

    def job_created
    end
    def job_updated
    end
    def job_liked
    end
    def job_unliked
    end

    def job_comment_created
    end
  end
end
