module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, resolver: Queries::Auth::MeQuery

    #Jobs
    field :jobs, resolver: Queries::Jobs::JobsQuery
    field :published_jobs, resolver: Queries::Jobs::PublishedJobsQuery
    field :job, resolver: Queries::Jobs::JobQuery

    #Geolocation
    field :forward_geocoding,
          resolver: Queries::Geolocation::ForwardGeocodingQuery
  end
end
