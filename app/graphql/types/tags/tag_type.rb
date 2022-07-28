# frozen_string_literal: true

module Types
  module Tags
    class TagType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false, description: "Name of the tag"
    end
  end
end
