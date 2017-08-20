class CreateCabs < ActiveRecord::Migration[5.1]
  def change
    create_table :cabs do |t|
      t.string :registration_number, null: false
      t.string :status, null: false
      t.string :color
      t.string :modelname
      t.float  :lat, null: false
      t.float  :long, null: false
      t.timestamps
    end
  end
end
