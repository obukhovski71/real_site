class UserEvents < ActiveRecord::Migration
  def self.up
    rename_table :photo_users, :user_photos
    create_table :user_events do |t|
      t.references :event
      t.references :user
      t.string :summary
      t.timestamps
    end
    add_index :user_events, ['user_id', 'event_id']
  end
  def self.down
    rename_table :user_photos, :photo_users
    drop_table :user_events
  end
end
