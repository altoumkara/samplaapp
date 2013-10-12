class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	#For our application’s design choice, which involves persistent sessions—that is, signin status that lasts even after browser close—we need to use a permanent identifier for the signed-in user. To accomplish this, we’ll generate a unique, secure remember token for each user and store it as a permanent cookie rather than one that expires on browser close.

    #The remember token needs to be associated with a user and stored for future use, so we’ll add it as an attribute to the User model

  	#One technique for maintaining the user signin status is to use a traditional Rails session (via the special session function) to store a remember token equal to the user’s id:
  	add_column :users, :remember_token, :string

  	#because we expect to retrieve users by remember token, we’ve added an index (Box 6.2) to the remember_token column.
  	add_index :users, :remember_token

  	#Next afer the above steps, we update the development and test databases as usual by
	#$ bundle exec rake db:migrate
	#$ bundle exec rake test:prepare


  end
end
