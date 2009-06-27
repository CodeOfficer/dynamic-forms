class CreateAssetTemplates < ActiveRecord::Migration
  def self.up
    create_table :asset_templates do |t|
      t.string :name
      t.text :form_data
      t.timestamps
    end
    add_index :asset_templates, :id
  end

  def self.down
    drop_table :asset_templates
  end
end
