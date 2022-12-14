module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, resolver: Queries::Auth::MeQuery

    #Jobs
    field :jobs, resolver: Queries::Jobs::JobsQuery
    field :job, resolver: Queries::Jobs::JobQuery

    #Geolocation
    field :forward_geocoding,
          resolver: Queries::Geolocation::ForwardGeocodingQuery

    #Tags
    field :tags, resolver: Queries::Tags::TagsQuery

    #Messages
    field :message_conversation,
          resolver: Queries::Messages::MessageConversationQuery
  end
end
