# frozen_string_literal: true

module Types
  module Locations
    class LocationType < Types::BaseObject
      field :id, ID, null: false
      field :name, String
      field :latitude, Float
      field :longitude, Float
    end
  end
end
