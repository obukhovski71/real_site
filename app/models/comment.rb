class Comment < ActiveRecord::Base
  set_table_name "comment_photos"
  belongs_to :user
  belongs_to :photo
  ## belongs_to :event
end
