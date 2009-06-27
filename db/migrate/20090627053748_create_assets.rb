class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :name
      t.references :template
      t.text :data
      t.timestamps
    end
    add_index :assets, :id
    add_index :assets, :template_id
  end

  def self.down
    drop_table :assets
  end
end
