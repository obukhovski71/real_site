class AddEventIdToPhotos < ActiveRecord::Migration
  def up
    add_column("photos","event_id",:integer)
  end

  def down
    remove_column("photos","event_id")
  end
end
