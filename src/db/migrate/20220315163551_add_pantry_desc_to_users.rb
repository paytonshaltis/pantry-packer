class AddPantryDescToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pantry_desc, :text
  end
end
