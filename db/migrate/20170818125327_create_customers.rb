class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.timestamps
      t.string :name, null: false
      t.float :long, null: false
      t.float :lat, null: false
    end
  end
end
