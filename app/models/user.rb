class User < ActiveRecord::Base
  has_many :photo_users
  has_many :photo_events
  has_many :photos
  has_many :events
  
  attr_accessor :password
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]\.[A-Z{2,4}$]/i
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
  #validates :email, presence => true, length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true
  
  # only on create, so other atributes of this user can be changed
  #validates_length_of :password, :within => 4..25, :on => :create
  
  before_save :create_hashed_password
  after_save :clear_password
  
  attr_protected :hashed_password, :salt
  
  def name
    "#{first_name} #{last_name}"
  end
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password,salt)
  end
  def self.authenticate(username="", password="")
    user = User.find_by_user_name(username)
    ## user = User.where("user_name = ? ", username).first
    debugger
    if user && user.password_match?(password)
      return user
    else
      return false  
    end
  end

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt" )
  end
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}" )
  end
  
  
  private
  def create_hashed_password
    unless password.blank?
      self.salt = User.make_salt(username) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt) 
    end
  end
  def clear_password
    self.password = nil
  end
  # def recent_photos
  #   self.photos.find(:all, order => "date ASC", limit => 7)
  # end
  # has_many :recent_photos, :class_name => "Photo", :order => "date ASC", :limit => 5  
end
