class Campaign < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # must have a unique name and a slug
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  has_many :donations

  belongs_to :project

  default_scope {order(end_date: :desc)}
end
