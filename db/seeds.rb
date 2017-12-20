require 'random_data'

# Create Users
#5.times do
	#User.create!(
	#	email: 			RandomData.random_email,
	#	password: 	RandomData.random_sentence
	#)
#end
#users = User.all

# Create Topics
15.times do
	Topic.create!(
		name: 			 RandomData.random_sentence,
		description: RandomData.random_paragraph
	)
end

# Create Wikis
50.times do
		wiki = Wiki.create!(
			title: RandomData.random_sentence,
			body:	 RandomData.random_paragraph
		)
end

wikis = Wiki.all

puts "Seed finished"
puts "-.-.-.-.-.-.-"
puts "#{Topic.count} total topics"
puts "#{Wiki.count} total wikis"


