class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :user_id
      t.decimal :sub_total, :precision => 10, :scale => 2
      t.decimal :tax, :precision => 10, :scale => 2
      t.timestamps
    end

    add_index :sales, :user_id
  end

  def self.down
    drop_table :sales
  end
end
