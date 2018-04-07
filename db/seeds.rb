require 'random_data'


# Create Users
5.times do
 User.create!(
 email:    Faker::Internet.email,
 password: RandomData.random_sentence
 )
end
users = User.all


# Create Wikis
50.times do
 Wiki.create!(
   user:   users.sample,
   title:  Faker::Name.title,
   body:   RandomData.random_paragraph,
   private: false
 )
end
wikis = Wiki.all

# Create admin user
1.times do
 User.create!(
 email:     'liviaishak1@gmail.com',
 password:  'helloworld',
 role:       2
 )
end

# Create standard user
1.times do
 User.create!(
 email:    'liviaishak91@gmail.com',
 password: 'helloworld'
 )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
