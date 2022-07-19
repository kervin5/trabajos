class Job < ApplicationRecord
  include ::PgSearch::Model
  belongs_to :author, class_name: :User
  belongs_to :location
  validates :title, presence: true
  validates :content, length: { minimum: 10 }, allow_blank: true
  acts_as_taggable_on :tags

  pg_search_scope :search_by_text,
                  against: %i[title content],
                  associated_against: {
                    location: :name
                  },
                  using: {
                    tsearch: {
                      dictionary: "spanish",
                      tsvector_column: "searchable"
                    },
                    trigram: {
                      word_similarity: true
                    },
                    dmetaphone: {
                    }
                  },
                  ignoring: :accents

  scope :search_by_location,
        ->(latitude:, longitude:, distance: 20) {
          joins(:location).where(
            "(earth_box(ll_to_earth(:latitude, :longitude), :distance) @> ll_to_earth(locations.latitude, locations.longitude)
    AND earth_distance(ll_to_earth (:latitude, :longitude), ll_to_earth (locations.latitude, locations.longitude)) < :distance)",
            {
              latitude: latitude,
              longitude: longitude,
              distance: distance * 1000
            }
          )
        }

  STATUS = { DRAFT: "draft", PUBLISHED: "published" }
end
