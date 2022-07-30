class Job < ApplicationRecord
  include ::PgSearch::Model
  #Third party mixins
  acts_as_taggable_on :tags
  acts_as_votable
  acts_as_commentable

  # Associations
  belongs_to :author, class_name: :User
  belongs_to :location
  validates :title, presence: true
  validates :content, length: { minimum: 10 }, allow_blank: true

  #Scopes
  pg_search_scope :by_text,
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

  scope :by_location_coordinates,
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

  STATUS = {
    DRAFT: "draft",
    PUBLISHED: "published",
    EXPIRED: "expired",
    ARCHIVED: "archived"
  }.freeze

  def self.create_with_data(data, user)
    location =
      LocationsService::Locations.find_or_create_location_by_name(
        data.location_name
      )
    job =
      Job.create!(
        title: data.title,
        content: data.content,
        location: location,
        author: user
      )

    if data.tags.present?
      job.tag_list.add(data.tags)
      job.save
    end
    job
  end

  def update_with_data(data)
    location =
      LocationsService::Locations.find_or_create_location_by_name(
        data.location_name
      )

    self.update!(
      title: data.title,
      content: data.content,
      location: location,
      status: data.status
    )

    if data.tags.present?
      self.tag_list.remove(self.tag_list)
      self.tag_list.add(data.tags)
      self.save
    end
    self
  end
end
