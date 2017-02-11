class Partner < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # must have a name and a slug
  validates_presence_of :name, :slug

  has_many :projects

  default_scope {order(name: :asc)}
end
