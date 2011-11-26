class CreatePhotoEvents < ActiveRecord::Migration
  def self.up
    create_table :photo_events do |t|
      t.references :photo
      t.references :event
      t.string :summary
      t.timestamps
    end
    add_index :photo_events, ['photo_id','event_id']
  end
  def self.down
    
  end
end
