class User < ApplicationRecord
  extend Devise::Models # Include default devise modules.
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :jobs
  acts_as_taggable_on :tags
end
