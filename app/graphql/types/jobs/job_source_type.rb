# frozen_string_literal: true

module Types
  module Jobs
    class JobSourceType < Types::BaseEnum
      description "Source enum"

      value "internal"
      value "external"
    end
  end
end
