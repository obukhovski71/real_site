class AddStatusToPhotosCommentsEventsPosts < ActiveRecord::Migration
  def up
    add_column :photos, :status, :integer, :default => 0
    add_column :events, :status, :integer, :default => 0
    add_column :first_page_posts, :status, :integer, :default => 0
    add_column :comment_photos, :status, :integer, :default => 0
  end
  def down
    remove_column :photos, :status
    remove_column :events, :status
    remove_column :first_page_posts, :status
    remove_column :comment_photos, :status
  end
end
