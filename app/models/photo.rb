class Photo < ActiveRecord::Base
  has_many :photo_users
  has_many :comment_photos
  belongs_to :event
  belongs_to :user
end
