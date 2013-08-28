class User < ActiveRecord::Base
	before_save{ self.email = email.downcase}
	#before_save { email.downcase! } this one is the same as the one on top
	validates :name, presence: true , length: {maximum: 50} #this one and the bottom one are the same but difference syntax
	#validates (:name, presence: true)
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # VALID_EMAIL_REGEX is a constant
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6}
  

end
