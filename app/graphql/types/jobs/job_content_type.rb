# frozen_string_literal: true

module Types
  module Jobs
    class JobContentType < Types::BaseObject
      field :html, String, null: false
      field :plainText, String, null: false
    end
  end
end
