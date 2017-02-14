class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # must have a unique name and a slug
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  belongs_to :partner
  belongs_to :location

  has_many :campaigns
  has_one :address, as: :addressable

  default_scope {order(name: :asc)}
end
