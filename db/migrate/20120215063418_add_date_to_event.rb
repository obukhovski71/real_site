class AddDateToEvent < ActiveRecord::Migration
  def up
    add_column("events","date",:date)
  end

  def down
    remove_column("events","date")
  end
end
