class Job < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :title, presence: true
  validates :description, length: { minimum: 10 }, allow_blank: true
  acts_as_taggable_on :tags
end
