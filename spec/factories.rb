FactoryGirl.define do 
	factory :user do #By passing the symbol :user to the factory command, we tell Factory Girl that the subsequent definition is for a User model object.
		name "Alama Tounk"
		email "alama@example.com"
		password "foobar"
    password_confirmation "foobar"
  end
end
