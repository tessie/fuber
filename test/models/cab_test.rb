require 'test_helper'
require 'minitest/autorun'

describe Cab do

  before do
    @cab = build(:cab)
  end

  it 'should save the object' do
    assert @cab.save
  end

  it 'should not save cab with blank status' do
    @cab.status = nil
    assert !@cab.save
  end

  it 'should not save cab with blank registration number' do
    @cab.registration_number = nil
    assert !@cab.save
  end

  it 'should not save cab with blank latitude' do
    @cab.lat = nil
    assert !@cab.save
  end

  it 'should not save cab with blank long' do
    @cab.long = nil
    assert !@cab.save
  end

  it 'should not save when status is not booked/available' do
    @cab.status = 'abdc'
    assert !@cab.save
  end

  it 'should not save when cab registration number is not unique' do
    @cab.save
    refute build(:cab, registration_number: @cab.registration_number).save
  end
end
