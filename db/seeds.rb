require 'random_data'

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
		email:								Faker::Internet.email,
		password: 						Faker::Internet.password(8)
	)
end

# Create wikis
50.times do
	wiki = Wiki.create!(
		topic: topics.sample,
		title: Faker::StarWars.planet,
		body:	 Faker::Lorem.paragraphs(10, true)
	)
end
wikis= Wiki.all

puts "Seed finished"
puts "-.-.-.-.-.-.-"
puts "#{Topic.count} total categories"
puts "#{Wiki.count} total wikis"
puts "#{User.count} total users"