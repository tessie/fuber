class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.float :starting_lat, null: false
      t.float :starting_long, null: false
      t.float :ending_lat
      t.float :ending_long
      t.datetime :start_time
      t.datetime :end_date
      t.float :amount
      t.timestamps
    end
  end
end
