class AddPantryNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pantry_name, :string
  end
end
