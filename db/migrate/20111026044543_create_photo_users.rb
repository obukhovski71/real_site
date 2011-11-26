class CreatePhotoUsers < ActiveRecord::Migration
  def self.up
    create_table :photo_users do |t|
      t.references :photo
      t.references :user
      t.string :summary
      t.timestamps
    end
    add_index :photo_users, ['user_id', 'photo_id']
  end
  def self.down
    drop_table :photo_users
  end
end
