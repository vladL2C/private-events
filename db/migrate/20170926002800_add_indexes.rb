class AddIndexes < ActiveRecord::Migration[5.1]
  def change
  	add_index :events, [:creator_id, :created_at]
  	add_index :attendances, [:user_id, :event_id]
  end
end
