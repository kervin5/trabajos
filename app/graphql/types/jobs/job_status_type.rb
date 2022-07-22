# frozen_string_literal: true

module Types
  module Jobs
    class JobStatusType < Types::BaseEnum
      description "Status enum"
      value "draft"
      value "published"
      value "archived"
      value "expired"
      value "trashed"
    end
  end
end
