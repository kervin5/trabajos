module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include GraphqlAuthHelper
  end
end
