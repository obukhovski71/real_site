class DropColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column("users","hashed_password")
    remove_column("users","user_name")
    remove_column("users","salt")
  end

  def down
    add_column("users","hashed_password",:string)
    add_column("users","user_name",:string)
    add_column("users","salt",:string)
  end
end
