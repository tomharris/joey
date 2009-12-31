class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :balance, :precision => 10, :scale => 2
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
