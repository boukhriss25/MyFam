# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

avatars = "https://kitt.lewagon.com/placeholder/users/random"

puts 'Cleaning database of all users...'
User.destroy_all
puts 'Initiating users seed...'

User.create(
  email: "amine@gmail.com",
  password: "password",
  username: "Amine",
  # remote_avatar_url: avatars
)

User.create(
  email: "rita@gmail.com",
  password: "password",
  username: "Rita",
  # remote_avatar_url: avatars
)

User.create(
  email: "mehdi@gmail.com",
  password: "password",
  username: "Mehdi",
  # remote_avatar_url: avatars
)

User.create(
  email: "glen@gmail.com",
  password: "password",
  username: "Glen",
  # remote_avatar_url: avatars
)

User.create(
  email: "wendela@gmail.com",
  password: "password",
  username: "Wendela",
  # remote_avatar_url: avatars
)

puts 'Cleaning database of all families...'
Family.destroy_all
puts 'Initiating family seed...'


Family.create(
  name: "Lövgren",
  # remote_avatar_url: avatars
)

Family.create(
  name: "Warren",
  # remote_avatar_url: avatars
)

Family.create(
  name: "Idrissi",
  # remote_avatar_url: avatars
)

Family.create(
  name: "Boukhriss",
  # remote_avatar_url: avatars
)

Family.create(
  name: "Sanchez",
  # remote_avatar_url: avatars
)

puts 'Cleaning database of all conversations...'
Conversation.destroy_all
puts 'Initiating conversation seed...'

convo_names = [
  "cousins",
  "uncles",
  "dad's birthday",
  "Trip to Peru",
  "Jennifer",
  "William",
  "Arnold",
  "Ellyn",
  "Thomas",
  "Tim",
  "Lucas",
  "Graduation party",
  "Career plans",
  "Restaurant recommendations",
  "Music chat"
]

i = Family.first.id
5.times do
  Conversation.create(
    name: "Main chat",
    family_id: "#{i}".to_i
  )
  i += 1
end

15.times do
  Conversation.create(
    name: convo_names.sample,
    family: Family.all.sample,
  )
end

puts 'Cleaning database of all memberships...'
Membership.destroy_all
puts 'Initiating membership seed...'

x = Family.first.id
5.times do
  y = User.first.id
  5.times do
    Membership.create(
      user_id: "#{y}".to_i,
      family_id: "#{x}".to_i
    )
    y += 1
  end
  x += 1
end

10.times do
  Membership.all.sample.destroy
end

puts 'Cleaning database of all subscriptions...'
Subscription.destroy_all
puts 'Initiating subscription seed...'

n = Conversation.first.id
o = Conversation.last.id
convos = Conversation.where(id: (n..o))

20.times do
  a = User.first.id
  5.times do
    Subscription.create(
      user_id: "#{a}".to_i,
      conversation: convos.sample
    )
    a += 1
  end
end



# c = Conversation.first.id
# 5.times do
#   d = User.first.id
#   5.times do
#   Subscription.create(
#     conversation_id: "#{c}".to_i,
#     user_id: "#{d}".to_i
#     )
#     d += 1
#   end
#   c += 1
# end

puts 'Cleaning database of all messages...'
Message.destroy_all
puts 'Initiating messages seed...'

50.times do
  Message.create(
    user: User.all.sample,
    conversation: Conversation.all.sample,
    content: Faker::Marketing.buzzwords
  )
end

10.times do
  Message.create(
    user: User.all.sample,
    conversation: Conversation.all.sample,
    content: "Pantologic andvari mommsen gregariousness transformable rectocele turnbuckle phosphine mazing palstave deflation inspissating completively scunge. Saplessness heavenless vivifying vignettist unguiculated coprophagist loutish isolator interindependence claromontanus noncircumspect keek interjaculating dedans. Archdiocesan raymond pinturicchio janina kwame disuniting frapping decoy"
  )
end



