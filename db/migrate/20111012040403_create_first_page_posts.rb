class CreateFirstPagePosts < ActiveRecord::Migration
  def change
    create_table :first_page_posts do |t|
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end
