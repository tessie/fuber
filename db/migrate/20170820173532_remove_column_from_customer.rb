class RemoveColumnFromCustomer < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :lat, :string
    remove_column :customers, :long, :string
  end
end
