class User < ApplicationRecord
  has_many :jobs, dependent: :destroy
  acts_as_taggable_on :tags
end
