class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.string :name
      t.text :form_data
      t.timestamps
    end
    add_index :templates, :id
  end

  def self.down
    drop_table :templates
  end
end
