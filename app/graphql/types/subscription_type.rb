module Types
  class SubscriptionType < GraphQL::Schema::Object
    field :job_created,
          Types::JobType,
          null: false,
          description: "An job was created"
    field :job_updated,
          Types::JobType,
          null: false,
          description: "An job was updated"

    def job_created
    end
    def job_updated
    end
  end
end