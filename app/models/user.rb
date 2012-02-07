class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable  ##, :confirmable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :last_name, :first_name, :date_of_birth, :remember_me, :password, :password_confirmation, :role_id, :avatar
  validates_presence_of :name, :last_name, :first_name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  # has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  has_many :photo_users
  has_many :photo_events
  has_many :photos
  has_many :events
  has_attached_file :avatar
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]\.[A-Z{2,4}$]/i
  
  def full_name
    return first_name + " " + last_name
  end
end
