class User < ActiveRecord::Base
	before_save{ self.email = email.downcase}
	before_create :create_remember_token  #we add a callback method to create a remember token immediately before creating a new user in the database
	#This code, called a method reference, arranges for Rails to look for a method called create_remember_token and run it before saving the user
	
	#before_save { email.downcase! } this one is the same as the one on top
	validates :name, presence: true , length: {maximum: 50} #this one and the bottom one are the same but difference syntax
	#validates (:name, presence: true)
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
 # VALID_EMAIL_REGEX is a constant
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
 has_secure_password
validates :password, presence: true, length: { minimum: 6} 

def User.new_remember_token
    SecureRandom.urlsafe_base64
    #The encrypt and new_remember_token methods are attached to the User class because they don’t need a user instance to work,5 and they are public methods (above the private line) because in Section 8.2.3 we will put them to use outside of the User model.
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
    #Note that we’ve encrypted the remember token using SHA1, a hashing algorithm much faster than the Bcrypt algorithm used to encrypt user passwords
  end


		#Second, the method itself is only used internally by the User model, so there’s no need to expose it to outside users. As we saw in Section 7.3.2, the Ruby way to accomplish this is to use the private keyword:
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
      #Because of the way Ruby handles assignments inside objects, without self the assignment would create a local variable called remember_token, which isn’t what we want at all. Using self ensures that assignment sets the user’s remember_token, and as a result it will be written to the database along with the other attributes when the user is saved.
# u cAN CHECK app/helpers/sessions_helper.rb 
    end

end
