# Create Users
5.times do
	user = User.create!(
		email:			Faker::Internet.email,
		password: 	Faker::Internet.password(8)
	)
end

# Create admin user
User.create!(
	email:								 'admin@omniwiki.com',
	password:							 'password',
	role:									 'admin'
)
user.skip_confirmation!
user.save!

# Create premium user
User.create!(
	email: 								 'premium@omniwiki.com',
	password: 						 'password',
	role:									 'premium'
)
user.skip_confirmation!
user.save!

# Create standard user
User.create!(
	email:								 'user@omniwiki.com',
	password:							 'password',
	role:									 'standard'
)
user.skip_confirmation!
user.save!
users = User.all

# Create wikis
50.times do
	wiki = Wiki.create!(
		user:  			users.sample,
		quote: 			Faker::StarWars.quote,
		title: 			Faker::StarWars.planet,
		body:	 			Faker::Lorem.paragraphs(10),
		private:		true
	)
end
wikis= Wiki.all

puts "Seed finished"
puts "-.-.-.-.-.-.-"
puts "#{Wiki.count} total wikis"
puts "#{User.count} total users"