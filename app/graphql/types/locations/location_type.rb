# frozen_string_literal: true

module Types
  module Locations
    class LocationType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :latitude, Float, null: false
      field :longitude, Float, null: false
    end
  end
end
