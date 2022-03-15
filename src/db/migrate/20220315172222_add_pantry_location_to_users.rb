class AddPantryLocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pantry_location, :string
  end
end
