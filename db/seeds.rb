require 'faker'

#WE REMOVE ALL
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE")
Sending.delete_all
Message.delete_all
GossipTag.delete_all
Gossip.delete_all
User.delete_all
City.delete_all
Tag.delete_all

#TAGS
10.times do
  tag = Tag.create!(title: Faker::Book.unique.genre)
end

#CITIES
10.times do
  city = City.create!(name: Faker::Address.unique.city, postal_code: Faker::Address.unique.zip_code)
end

#USERS
10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence, email: Faker::Internet.free_email, age: rand(13..50), city_id: rand(1..City.count))
end

#GOSSIPS + TAG ON EACH GOSSIP
20.times do
  gossip = Gossip.create!(title: Faker::Book.title, content: Faker::Lorem.paragraph, user_id: rand(1..User.count))
  gossiptag = GossipTag.create!(gossip_id: Gossip.last.id, tag_id: rand(1..User.count))
end

#GOSSIPS + MORE RANDOM TAGS
random = rand(1..Gossip.count)
random.times do
  gossiptag = GossipTag.create!(gossip_id: rand(1..Gossip.count), tag_id: rand(1..User.count))
end

#MESSAGE
message = Message.create!(content: Faker::Lorem.paragraph)
message.save

#SENDING
sending = Sending.create!(message_id: rand(1..Message.count), sender_id: rand(1..User.count), receiver_id: rand(1..User.count))
sending.save
