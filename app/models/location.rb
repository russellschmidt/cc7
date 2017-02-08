class Location < ApplicationRecord
  # must have a name and a slug
  validates_presence_of :name, :slug

  extend FriendlyId
  friendly_id :name, use: :slugged
end
