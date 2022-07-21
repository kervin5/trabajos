class User < ApplicationRecord
  has_many :jobs
  acts_as_taggable_on :tags
end
