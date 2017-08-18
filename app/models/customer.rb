class Customer < ApplicationRecord
  validates_presence_of :name, :lat, :long

  has_many :trips
end
