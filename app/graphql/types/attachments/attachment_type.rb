# frozen_string_literal: true

module Types
    module Attachments
      class AttachmentType < Types::BaseObject 
        field :id, ID, null: false
        field :name, String, null: false
        field :url, String, null: false
        field :created_at, GraphQL::Types::ISO8601DateTime, null: false
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

        def created_at
          DateTime.new
        end

        def udpated_at
            DateTime.new
        end
      end
    end
  end
  