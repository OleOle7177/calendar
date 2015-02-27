FactoryGirl.define do 
	factory :user do 
		name "User"
		email "11@online.ru"
		password "12345678"
		
		factory :user2 do
			email "ww@mail.ru"
		end
	end	
end