require 'test_helper'
describe TripsController do

    before do
      @customer = create(:customer)
      @trip = create(:trip, customer: @customer)
    end

    describe '#test_trip_start' do
      it 'should raise 400 when params are missing' do
        post "/trips/#{@trip.id}/start", params: {}
        assert_response 400
      end

      it 'should start a trip'do
        params =  { customer_id: @customer.id, lat: 1, long: 2 }
        post "/trips/#{@trip.id}/start", params: params
        assert_response 200
        assert_equal JSON.parse(response.body), { 'status' => 'success', 'message' => 'Ride Started' }
      end

      it 'should fail when a trip is already started' do
        @trip.update_attribute(:status, 'started')
        params =  { customer_id: @customer.id, lat: 1, long: 2 }
        post "/trips/#{@trip.id}/start", params: params
        assert_response 200
        assert_equal JSON.parse(response.body), { 'status' => 'failure', 'message' => 'Sorry.trip could not be started' }
      end
    end

    describe '#test_trip_end' do
      it 'should raise 400 when params are missing' do
        post "/trips/#{@trip.id}/end", params: {}
        assert_response 400
      end

      it 'should complete a trip when a trip has started'do
        @trip.update_attributes(status: 'started', start_time: 5.minutes.ago, starting_lat: 0, starting_long:  0)
        params =  { customer_id: @customer.id, lat: 0, long: 2 }
        post "/trips/#{@trip.id}/end", params: params
        assert_response 200
        assert_equal JSON.parse(response.body), { 'status' => 'success', 'message' => 'Ride End', 'amount'=> '9.0 Dogecoin' }
      end

      it 'should fail when a trip is already completed' do
        @trip.update_attribute(:status, 'completed')
        params =  { customer_id: @customer.id, lat: 1, long: 2 }
        post "/trips/#{@trip.id}/end", params: params
        assert_response 200
        assert_equal JSON.parse(response.body), { 'status' => 'failure', 'message' => 'Sorry.Could mot end trip' }
      end
    end
end
