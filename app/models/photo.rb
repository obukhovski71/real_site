class Photo < ActiveRecord::Base
  has_many :user_photos
  has_many :users, :through => :user_photos
  has_many :comments
  belongs_to :event
  has_attached_file :c_image,
    :styles => {
    :thumb=> "100x100", 
    :regular => "960x720"}
end
