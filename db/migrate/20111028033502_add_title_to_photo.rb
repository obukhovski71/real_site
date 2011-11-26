class AddTitleToPhoto < ActiveRecord::Migration
  def up
    add_column :photos, :title, :string, :default => "no present"
  end
  def down
    remove_column :photos, :title
  end
end
