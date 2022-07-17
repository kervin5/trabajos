module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, resolver: Queries::Auth::MeQuery
    field :jobs, resolver: Queries::Jobs::JobsQuery
    field :job, resolver: Queries::Jobs::JobQuery
  end
end
