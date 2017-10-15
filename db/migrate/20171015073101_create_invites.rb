class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :invitor_id
      t.integer :invitee_id
      t.integer :event_id

      t.timestamps
    end
  end
end
