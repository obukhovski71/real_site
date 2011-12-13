class Photo < ActiveRecord::Base
  has_many :photo_users
  has_many :comments
  belongs_to :event
  belongs_to :user
end
