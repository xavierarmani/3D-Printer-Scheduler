class User < ActiveRecord::Base
  EMAIL_REGEX = /\A\S+@.+\.\S+\z/
  # allows: letters (capital and lowercase) numbers, dashes and underscores.
  USER_REGEX = /\A[\w-]+\z/
  # must be at least 6 characters and include one number and one letter.
  PW_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{3,}\z/
  
  #user must enter user name
  validates :userName, :presence => true, :uniqueness => true, :format => USER_REGEX
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :presence => true, :format => PW_REGEX
  
  before_save :encrypt_password
  after_save :clear_password

  
  def encrypt_password
    return if persisted? && password == User.find(id).password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end
  def clear_username
    self.userName = nil
  end
  
  #verifys that the entered username and password match an user entry in the database table
  def self.authenticate(username_or_email="", login_password="")
    if  EMAIL_REGEX.match(username_or_email)    
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_userName(username_or_email)
    end
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end
  
  #checks the password by hashing the entered plain text password with the salt value
  def match_password(login_password="")
    password == BCrypt::Engine.hash_secret(login_password, salt)
  end
    
    
end
