class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description, :default =>""
      t.date :date, :default =>"", :null => false
      t.string :path
      t.string :geo_location
      t.integer :user_id
      t.integer :height
      t.integer :width
      t.timestamps
    end
    add_index "photos", :user_id
  end
end
