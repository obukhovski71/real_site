class CreateCommentPhotos < ActiveRecord::Migration
  def change
    create_table :comment_photos do |t|
      t.text :body
      t.integer :user_id
      t.integer :photo_id
      t.timestamps
    end
  end
end
