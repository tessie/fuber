class Cab < ApplicationRecord

  has_many :trips

  validates_presence_of :registration_number, :status, :lat, :long

  STATUS = %w(booked available)

  validates_inclusion_of :status, in: STATUS
  validates_uniqueness_of :registration_number

  scope :available_cabs, -> { where( status: 'available').order(created_at: 'desc') }


end
