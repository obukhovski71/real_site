class AlterUsers < ActiveRecord::Migration
  def up
    add_column("users","date_of_birth",:date)
    rename_column("users", "password","hashed_password")
    add_column("users","salt", :string)
    add_index("users","user_name")
  end

  def down
    remove_index("users","user_name" )
    remove_column("users","salt")
    rename_column("users", "hashed_password","password")
    remove_column("users","date_of_birth")
  end
end
