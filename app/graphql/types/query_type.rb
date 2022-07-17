module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, Types::UserType, null: true

    field :jobs,
          [Types::JobType],
          null: false,
          description: "Returns a list of jobs"

    def jobs
      Job.preload(:user).all
    end

    def me
      context[:current_user]
    end
  end
end
