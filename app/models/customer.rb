class Customer < ApplicationRecord
  validates_presence_of :name, :lat, :long
end
