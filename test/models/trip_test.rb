require 'test_helper'
require 'minitest/autorun'

describe Trip do

  before do
    @trip = build(:trip)
  end

  it 'should save the object' do
    assert @trip.save
  end

  it 'should not save when trips end time is less that start time' do
    @trip.start_time = Date.today
    @trip.end_time = Date.yesterday
    refute @trip.save
  end

  describe '#test_start_trip' do
    it 'should set starting coordinates and starttime' do
      @trip.start_trip(1, 2)
      assert @trip.starting_lat, 1
      assert @trip.starting_lat, 2
      assert @trip.start_time.present?
    end
  end

  describe '#test_end_trip' do
    it 'should set  ending coordinates and endttime' do
      @trip.end_trip(1, 2)
      assert @trip.ending_lat, 1
      assert @trip.ending_long, 2
      assert @trip.end_time.present?
    end
  end

  describe '#test_caculate_and_update_amount' do
    it 'should set amount' do
      @trip.update_attributes(starting_lat: 4, ending_lat: 2,
                              starting_long: 2, ending_long: 2,
                              start_time: 5.minutes.ago, end_time: Time.now)
      @trip.caculate_and_update_amount
      assert @trip.amount, 9
    end

    it 'should an extra 5 dogecoin when color is pink' do
      pink_cab = build(:cab, color: 'pink')
      @trip.update_attributes(starting_lat: 4, ending_lat: 2, cab: pink_cab,
                              starting_long: 2, ending_long: 2,
                              start_time: 5.minutes.ago, end_time: Time.now)
      @trip.caculate_and_update_amount
      assert @trip.amount, 14
    end
  end
end
