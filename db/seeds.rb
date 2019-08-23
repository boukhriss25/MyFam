require 'faker'

avatars = "https://kitt.lewagon.com/placeholder/users/random"

puts 'Cleaning database of all users...'
User.destroy_all
puts 'Cleaning database of all families...'
Family.destroy_all
puts 'Cleaning database of all conversations...'
Conversation.destroy_all
puts 'Cleaning database of all memberships...'
Membership.destroy_all
puts 'Cleaning database of all subscriptions...'
Subscription.destroy_all
puts 'Cleaning database of all messages...'
Message.destroy_all

puts 'Initiating users seed...'

User.create(
  email: "amine@gmail.com",
  password: "password",
  username: "Amine",
  remote_avatar_url: avatars
)

User.create(
  email: "mehdi@gmail.com",
  password: "password",
  username: "Mehdi",
  remote_avatar_url: avatars
)

User.create(
  email: "glen@gmail.com",
  password: "password",
  username: "Glen",
  remote_avatar_url: avatars
)

User.create(
  email: "wendela@gmail.com",
  password: "password",
  username: "Wendela",
  remote_avatar_url: avatars
)

User.create(
  email: "rita@gmail.com",
  password: "password",
  username: "Rita",
  remote_avatar_url: avatars
)

User.create(
  email: "bob@gmail.com",
  password: "password",
  username: "Bob",
  remote_avatar_url: avatars
)

User.create(
  email: "ellyn@gmail.com",
  password: "password",
  username: "Ellyn",
  # remote_avatar_url: avatars
)

User.create(
  email: "inou@gmail.com",
  password: "password",
  username: "Inou",
  remote_avatar_url: avatars
)

User.create(
  email: "avalon@gmail.com",
  password: "password",
  username: "Avalon",
  # remote_avatar_url: avatars
)

User.create(
  email: "claire@gmail.com",
  password: "password",
  username: "Claire",
  # remote_avatar_url: avatars
)

User.create(
  email: "nico@gmail.com",
  password: "password",
  username: "Nico",
  remote_avatar_url: avatars
)

User.create(
  email: "armani@gmail.com",
  password: "password",
  username: "Armani",
  remote_avatar_url: avatars
)

puts 'Initiating family seed...'

Family.create(
  name: "Lövgren",
  # remote_avatar_url: avatars
)

Family.create(
  name: "Warren",
  remote_avatar_url: "https://res.cloudinary.com/glenwarren/image/upload/v1566550247/pue3rtdpuy1s9usmgibu.jpg"
)

Family.create(
  name: "Idrissi",
  remote_avatar_url: "https://res.cloudinary.com/glenwarren/image/upload/v1566550262/miinvpjmcluayej8kskj.png"
)

Family.create(
  name: "Boukhriss",
  remote_avatar_url: "https://res.cloudinary.com/glenwarren/image/upload/v1566491046/zo9cqniyyec8qsuwhxpp.jpg"
)

Family.create(
  name: "Sanchez",
  remote_avatar_url: "https://res.cloudinary.com/glenwarren/image/upload/v1566491078/qwkw0ovyfokg2ssdcvw8.jpg"
)

puts 'Initiating conversation seed...'

convo_names = [
  "Cousins",
  "Uncles",
  "Dad's birthday",
  "OMG Puppies!",
  "Trip to Peru",
  "William",
  "Arnold",
  "Lucas' 30th",
  "Ellyn",
  "Shopping",
  "Thomas",
  "Tim",
  "Lucas",
  "Grandmas will",
  "Graduation party",
  "Career plans",
  "Restaurant recommendations",
  "Music chat"
]

families = Family.all

families.each do |f|
  Conversation.create(
    name: "Main chat",
    family: f
  )
  sample = convo_names.sample(rand(3..6))
  sample.each do |s|
    Conversation.create(
      name: s,
      family: f
    )
  end
end

puts 'Initiating membership seed...'

fams = Family.all
users = User.all

fams.each do |f|
  sample = users.sample(rand(6..8))
  sample.each do |s|
    Membership.create(
      user: s,
      family: f
    )
  end
end

puts 'Initiating subscription seed...'

convos = Conversation.where.not(name: "Main chat")

convos.each do |c|
  users = c.family.users
  sample = users.sample(rand(2..5))
  sample.each do |s|
    Subscription.create(
      user: s,
      conversation: c
    )
  end
end

main_convos = Conversation.where(name: "Main chat")

main_convos.each do |c|
  family_users = c.family.users
  family_users.each do |u|
    Subscription.create(
      user: u,
      conversation: c
    )
  end
end

puts 'Initiating messages seed...'

chats = Conversation.all

chats.each do |c|
  users = c.family.users
  rand(1..10).times do
    Message.create(
      user: users.sample,
      conversation: c,
      content: Faker::Marketing.buzzwords
    )
    sleep(rand(1..2))
  end
end

chats.each do |c|
  users = c.family.users
  1.times do
    Message.create(
      user: users.sample,
      conversation: c,
      content: "Pantologic andvari mommsen gregariousness transformable rectocele turnbuckle phosphine mazing inspissating completively scunge. Saplessness heavenless vivifying vignettist disuniting frapping decoy"
    )
    sleep(rand(1..2))
  end
end

chats.each do |c|
  users = c.family.users
  rand(1..7).times do
    Message.create(
      user: users.sample,
      conversation: c,
      content: Faker::Marketing.buzzwords
    )
    sleep(rand(1..2))
  end
end


