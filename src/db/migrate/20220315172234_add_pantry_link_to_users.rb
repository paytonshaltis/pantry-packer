class AddPantryLinkToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pantry_link, :string
  end
end
