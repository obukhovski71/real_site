class UsersDropEmailold < ActiveRecord::Migration
  def up
    remove_column("users","email_old")
  end

  def down
    add_column("users","email_old",:string)
  end
end
