class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.string   :session_id, :null => false
      t.text     :data
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
