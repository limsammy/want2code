require 'faker'

print "Loading..."
sleep(0.5)
print '.'
sleep(0.15)
print '.'
sleep(0.15)
print '.'

100.times do |i|
  User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password,
    avatar_url: Faker::Avatar.image, about: Faker::Lorem.sentence(3),
    cover_letter: Faker::Lorem.sentence(6), role: 0, created_at: rand(1.years).seconds.ago)
  puts "Created #{i} users!"

end