require 'test_helper'
describe CabsController do

  describe 'routes' do
    describe 'test_index' do
      it 'should list all available cabs' do
        cab = create(:cab, status: 'available')
        get '/cabs'
        assert_response :success
        assert_response 200
        assert_equal JSON.parse(response.body), { 'status' => 'success', 'cabs' => [JSON.parse(cab.to_json)] }
      end
    end

    describe 'test_book_nearest' do
      it 'should raise 400 when params are missing' do
        post '/cabs/book-nearest'
        assert_response 400
      end

      it 'should send failure response when there is no available cabs' do
        create(:cab, status: 'booked', lat: 1, long: 1)
        params = { 'customer_id' => 1, 'lat' => 1, 'long' => 1 }
        post '/cabs/book-nearest', params: params
        assert_response 200
        assert_equal JSON.parse(response.body), { 'status' => 'failure', 'message'=> 'Sorry no cabs are available' }
      end

      it 'should  book a cab when a request is valid' do
        customer = create(:customer)
        cab = create(:cab, lat: 1, long: 1, status: 'available')
        params = { 'customer_id' => customer.id, 'lat' => 1, 'long' => 1 }
        post '/cabs/book-nearest', params: params
        assert_response 200
        cab.reload
        assert_equal JSON.parse(response.body), { 'status' => 'success', 'cab' => JSON.parse(cab.to_json), 'message' => 'Booking Success' }
      end

      it 'should  book a pink  cab when a request when color pink is passed' do
        customer = create(:customer)
        create(:cab, lat: 1, long: 1, status: 'available')
        pink_cab = create(:cab, lat: 2, long: 2, status: 'available', registration_number: 'KL53856', color: 'pink')
        params = { 'customer_id' => customer.id, 'lat' => 1, 'long' => 1, color: 'pink' }
        post '/cabs/book-nearest', params: params
        assert_response 200
        pink_cab.reload
        assert_equal JSON.parse(response.body), { 'status' => 'success', 'cab' => JSON.parse(pink_cab.to_json), 'message' => 'Booking Success' }
      end
    end
  end
end
