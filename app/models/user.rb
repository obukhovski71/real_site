class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable  ##, :confirmable
  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :name, :last_name, :first_name, :date_of_birth, :remember_me, :password, :password_confirmation
  validates_presence_of :name, :last_name, :first_name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  # has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  
  has_many :photo_users
  has_many :photo_events
  has_many :photos
  has_many :events

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]\.[A-Z{2,4}$]/i
  
  def full_name
    return first_name + " " + last_name
  end
  
# Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :encrypted_password, :role_id,:user_name, :first_name, :last_name, :date_of_birth
  # accepts_nested_attributes_for :owned_organizations
  
  ## standart validation methods
  # validates_presence_of :first_name
  # validates_length_of :first_name, :maximum => 25
  # validates_uniqueness_of :username
  # validates_format_of :email, with => EMAIL_REGEX
  # validates_confirmation_of :email

  ## new syntax for validations:
  #validates :first_name, presence => true, length => { :maximum => 25 }
  #validates :last_name, presence => true, length => { :maximum => 50 }
  #validates :username, length => {:within => 3..25 }, uniqueness => true

  # only on create, so other atributes of this user can be changed
  #validates_length_of :password, :within => 4..25, :on => :create
  #validates :first_name, :presence => true, :length => { :maximum => 25 }
  #validates :last_name, :presence => true, :length => { :maximum => 50 }
  #validates :user_name, :presence => true, :length => {:within => 2..20}, :uniqueness => true
  #validates :email, presence => true, length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true
  #before_save :create_hashed_password
  #after_save :clear_password
  #validates_confirmation_of :password
  #attr_protected :hashed_password, :salt
  
#  def name
#    "#{first_name} #{last_name}"
#  end
#  def password_match?(password="")
#    hashed_password == User.hash_with_salt(password,salt)
#    puts hashed_password
#    debugger
#  end
#  def self.authenticate(username="", password="")
#    debugger
#    user = User.find_by_user_name(username)
#    ## user = User.where("user_name = ? ", username).first
#    ## debugger
#    if user && user.password_match?(password)
#    return user
#    else
#    return false
#    end
#  end
#  def self.make_salt(username="")
#    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt" )
#  end
#  def self.hash_with_salt(password="", salt="")
#    Digest::SHA1.hexdigest("Put #{salt} on the #{password}" )
#  end
#  private
#  def create_hashed_password
#    unless password.blank?
#    self.salt = User.make_salt(user_name) if salt.blank?
#    self.hashed_password = User.hash_with_salt(password, salt)
#    end
#  end
#  def clear_password
#    self.password = nil
#  end
# def recent_photos
#   self.photos.find(:all, order => "date ASC", limit => 7)
# end
# has_many :recent_photos, :class_name => "Photo", :order => "date ASC", :limit => 5
end
