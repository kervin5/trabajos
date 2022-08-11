module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include GraphqlAuth
  end
end
