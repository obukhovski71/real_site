class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, :through => :user_events
  ## has_many :photo_events 
  has_many :photos  ## , through => :photo_events 
end
