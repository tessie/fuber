class AddCabToTrip < ActiveRecord::Migration[5.1]
  def change
    add_reference :trips, :cab, foreign_key: true, index: true
  end
end
