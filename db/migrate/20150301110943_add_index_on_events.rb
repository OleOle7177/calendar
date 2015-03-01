class AddIndexOnEvents < ActiveRecord::Migration
  def self.up
  	add_index :events, [:date, :repeat]
  	add_index :events, [:date, :repeat, :user_id]
  end

  def self.down
  	remove_index :events, [:date, :repeat]
  	remove_index :events, [:date, :repeat, :user_id]
  end
end
