class AddCImageToPhoto < ActiveRecord::Migration
  def self.up
    remove_column :photos, :path
    remove_column :photos, :height
    remove_column :photos, :width
    add_column :photos, :c_image_file_name, :string
    add_column :photos, :c_image_content_type, :string
    add_column :photos, :c_image_file_size, :integer
    add_column :photos, :c_image_updated_at, :datetime
  end
  
  def self.down
    add_column :photos, :path, :string
    add_column :photos, :height, :integer
    add_column :photos, :width, :integer
    remove_column :photos, :c_image_file_name
    remove_column :photos, :c_image_content_type
    remove_column :photos, :c_image_file_size
    remove_column :photos, :c_image_updated_at
  end
end
