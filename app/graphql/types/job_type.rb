# frozen_string_literal: true

module Types
  class JobType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :author, Types::UserType, null: false

    def author
      object.user
    end
  end
end
