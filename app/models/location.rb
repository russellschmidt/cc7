class Location < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # must have a unique name and a slug
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  has_many :projects

  default_scope {order(name: :asc)}
end
