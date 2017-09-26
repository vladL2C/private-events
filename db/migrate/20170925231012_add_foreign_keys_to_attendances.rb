class AddForeignKeysToAttendances < ActiveRecord::Migration[5.1]
  def change
  	add_column :attendances, :user_id, :integer
  	add_column :attendances, :event_id, :integer
  end
end
