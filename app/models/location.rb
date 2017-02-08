class Location < ApplicationRecord
  # must have a name
  validates_presence_of :name

end
