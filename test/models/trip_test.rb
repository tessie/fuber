require 'test_helper'
require 'minitest/autorun'

describe Trip do

  before do
    @trip = build(:trip)
  end

  it 'should save the object' do
    assert @trip.save
  end

  it 'should not save customer with blank latitude' do
    @trip.starting_lat = nil
    assert !@trip.save
  end

  it 'should not save customer with blank long' do
    @trip.starting_long = nil
    assert !@trip.save
  end
end
