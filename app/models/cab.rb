class Cab < ApplicationRecord

  has_many :trips

  validates_presence_of :registration_number, :status, :lat, :long

  STATUS = %w(booked available)

  validates_inclusion_of :status, in: STATUS
  validates_uniqueness_of :registration_number

  scope :available_cabs, -> { where(status: 'available').order(created_at: 'desc') }
  scope :pink_available_cabs, -> { available_cabs.where(color: 'pink') }

  def available?
    status == 'available'
  end

  def book
    update_attribute(:status, 'booked') if available?
  end

  def self.car_list(color = nil)
    color == 'pink' ? pink_available_cabs : available_cabs
  end

  def self.nearest(lat, long, color = nil)
    nearest_cab = nil
    shortest_distance = Float::INFINITY
    car_list(color).each do |cab|
      distance = Math.sqrt((lat - cab.lat)**2 + (long - cab.lat)**2)
      if distance < shortest_distance
        shortest_distance = distance
        nearest_cab = cab
      end
    end
    nearest_cab
  end
end
