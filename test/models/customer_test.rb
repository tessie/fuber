require 'test_helper'
require 'minitest/autorun'

describe Customer do

  before do
    @customer = build(:customer)
  end

  it 'should save the object' do
    assert @customer.save
  end

  it 'should not save customer with blank name' do
    @customer.name = nil
    assert !@customer.save
  end

  it 'should not save customer with blank latitude' do
    @customer.lat = nil
    assert !@customer.save
  end

  it 'should not save customer with blank long' do
    @customer.long = nil
    assert !@customer.save
  end
end
