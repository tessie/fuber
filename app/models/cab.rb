class Cab < ApplicationRecord

  validates_presence_of :registration_number, :status, :lat, :long

  STATUS = %w(booked available)

  validates_inclusion_of :status, in: STATUS
end