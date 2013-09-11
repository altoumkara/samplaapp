class User < ActiveRecord::Base
	before_save{ self.email = email.downcase}
	#before_save { email.downcase! } this one is the same as the one on top
	validates :name, presence: true , length: {maximum: 50} #this one and the bottom one are the same but difference syntax
	#validates (:name, presence: true)
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
 # VALID_EMAIL_REGEX is a constant
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
 has_secure_password
validates :password, presence: true, length: { minimum: 6} 

#validates_confirmation_of :password, :on => :create
# validates_presence_of :password_confirmation, if: :password_changed?
 	
# validates :password_confirmation, presence: true 

 # def validates_confirmation_of(*attr_names)
 	# validates_with ConfirmationValidator, _merge_attributes(attr_names)
 	
 # end

end
