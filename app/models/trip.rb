class Trip < ApplicationRecord

  belongs_to :cab
  belongs_to :customer

  validates_presence_of :starting_lat, :starting_long
end
