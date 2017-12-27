# Create Topics/Categories
15.times do
	topic = Topic.create!(
		name: 			 Faker::StarWars.character
	)
end
topics = Topic.all

# Create Users
5.times do
	user = User.create!(
		email:			Faker::Internet.email,
		password: 	Faker::Internet.password(8)
	)
end

# Create admin user
1.times do
	User.create!(
		email:			'admin@omnipedia.com',
		password:		'password',
		role:				2
	)
end

# Create standard user
1.times do
	User.create!(
		email:			'user@omnipedia.com',
		password:		'password',
		role:       1
	)
end
users = User.all

# Create wikis
50.times do
	wiki = Wiki.create!(
		user:  			users.sample,
		topic: 			topics.sample,
		quote: 			Faker::StarWars.quote,
		title: 			Faker::StarWars.planet,
		body:	 			Faker::Lorem.paragraphs(10)
	)
end
wikis= Wiki.all

puts "Seed finished"
puts "-.-.-.-.-.-.-"
puts "#{Topic.count} total categories"
puts "#{Wiki.count} total wikis"
puts "#{User.count} total users"