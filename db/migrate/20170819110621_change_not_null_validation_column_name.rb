class ChangeNotNullValidationColumnName < ActiveRecord::Migration[5.1]
  def change
    change_column_null :trips, :starting_lat, true
    change_column_null :trips, :starting_long, true
  end
end
