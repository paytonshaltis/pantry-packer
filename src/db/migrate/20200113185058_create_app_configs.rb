# frozen_string_literal: true

# Create global configuration model for whatever use
# in necessary for this app
class CreateAppConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :app_configs do |t|
      t.string :name
      t.string :logo_url

      t.timestamps
    end
  end
end
