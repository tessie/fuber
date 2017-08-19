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

  describe '#test_book' do
    it 'should return false when cab is already booked' do
      cab = create(:cab, status: 'booked')
      refute cab.book
    end

    it 'should book when a  cab is available' do
      cab = create(:cab, status: 'available')
      cab.book
      assert cab.status, 'available'
    end
  end

  describe '#test_nearest' do
    it 'should return nil when no cabs are available' do
      create(:cab, status: 'booked')
      assert_nil Cab.nearest(10, 2)
    end

    it 'should return the nearest cab when there are available cabs' do
      cab1 = create(:cab, status: 'available', lat: 2, long: 0)
      create(:cab, status: 'available', lat: 100, long: 23, registration_number: 'KL543678')
      assert Cab.nearest(4, 0), cab1
    end

    it 'should return the closest when pink available car when color is pink' do
      pink_cab = create(:cab, status: 'available', lat: 3, long: 0, color: 'pink')
      create(:cab, status: 'available', lat: 100, long: 23, registration_number: 'KL543678', color: 'pink')
      create(:cab, status: 'available', lat: 2, long: 0, registration_number: 'KL543670')
      assert Cab.nearest(0, 0), pink_cab
    end
  end
end
