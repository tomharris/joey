class CreateInventoryItems < ActiveRecord::Migration
  def self.up
    create_table :inventory_items do |t|
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :inventory_items
  end
end
