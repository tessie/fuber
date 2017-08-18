class AddUniqueIndexRegistrationNumbertoCab < ActiveRecord::Migration[5.1]
  def change
    add_index :cabs, :registration_number, unique: true
  end
end
