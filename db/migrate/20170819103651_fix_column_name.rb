class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :trips, :end_date, :end_time
  end
end
