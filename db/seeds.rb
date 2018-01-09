# Create Users
20.times do
	user = User.find_or_initialize_by(email: Faker::Internet.email) do |user|
		user.password = 					 'password'
	end
	user.skip_confirmation!
	user.save!
end

# Create admin user
admin = User.find_or_initialize_by(email: 'admin@omniwiki.com') do |user|
	user.password =							 'password'
	user.role =									 'admin'
end
admin.skip_confirmation!
admin.save!

# Create premium user
premium = User.find_or_initialize_by(email: 'premium@omniwiki.com') do |user|
	user.password = 						 'password'
	user.role =								   'premium'
end
premium.skip_confirmation!
premium.save!

# Create standard user
standard = User.find_or_initialize_by(email: 'user@omniwiki.com') do |user|
	user.password =							 'password'
	user.role =									 'standard'
end
standard.skip_confirmation!
standard.save!
users = User.all

# Private wikis
5.times do
	private_wiki = Wiki.create!(
		title: 			Faker::StarWars.planet,
		quote: 			Faker::StarWars.quote,
		body:	 			Faker::Lorem.paragraph([rand(50), rand(100)], false),
		sources:    Faker::Internet.url,
		private:		true,
		user:				users.sample
	)
end

# Public Wikis
5.times do
	public_wiki = Wiki.create!(
		title: 			Faker::StarWars.planet,
		quote: 			Faker::StarWars.quote,
		body:	 			Faker::Lorem.paragraph([rand(50), rand(100)], false),
		sources:    Faker::Internet.url,
		private:		false,
		user:				users.sample
	)
end


puts "Seed finished"
puts "-.-.-.-.-.-.-"
puts "#{Wiki.count} total wikis"
puts "#{User.count} total users"