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
  acts_as_tagger
  acts_as_taggable_on :tags
  acts_as_voter
  acts_as_messageable class_name: "Message"

  def is_admin?
    self.role == "admin"
  end

  def is_employer?
    self.role == "employer"
  end
end
