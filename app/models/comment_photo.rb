class CommentPhoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  ## belongs_to :event
end
