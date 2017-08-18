class AddCustomerToTrip < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :customer, foreign_key: true, index: true
  end
end
