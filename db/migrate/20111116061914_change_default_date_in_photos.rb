class ChangeDefaultDateInPhotos < ActiveRecord::Migration
  def up
    change_column_default(:photos, :date, Time.now)
  end

  def down
    change_column_default(:photos, :date, '')
  end
end
