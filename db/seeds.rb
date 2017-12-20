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
	topic = Topic.create!(
		name: 			 RandomData.random_topic,
		description: RandomData.random_paragraph
	)
end
topics = Topic.all

# Create Wikis
50.times do
		wiki = Wiki.create!(
			topic: topics.sample,
			title: RandomData.random_wiki_title,
			body:	 RandomData.random_paragraph
		)
end
wikis = Wiki.all

puts "Seed finished"
puts "-.-.-.-.-.-.-"
puts "#{Topic.count} total topics"
puts "#{Wiki.count} total wikis"


