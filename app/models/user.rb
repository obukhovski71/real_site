class User < ActiveRecord::Base
  has_many :photo_users
  has_many :photo_events
  has_many :photos
  # def recent_photos
  #   self.photos.find(:all, order => "date ASC", limit => 7)
  # end
  # has_many :recent_photos, :class_name => "Photo", :order => "date ASC", :limit => 5  
end
