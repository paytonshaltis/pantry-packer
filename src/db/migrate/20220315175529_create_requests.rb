class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :type
      t.string :description
      t.boolean :ispositive

      t.timestamps
    end
  end
end
