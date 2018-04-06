class Place < ApplicationRecord
  belongs_to :stroll

  # validation
  validates_presence_of :name
end
