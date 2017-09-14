require 'faker'

# print "Loading..."
# sleep(0.5)
# print '.'
# sleep(0.15)
# print '.'
# sleep(0.15)
# print '.'

# 100.times do |i|
#   user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
#     username: Faker::Internet.unique.user_name, email: Faker::Internet.unique.email, password: Faker::Internet.password,
#     avatar_url: Faker::Avatar.unique.image, about: Faker::Lorem.sentence(3),
#     cover_letter: Faker::Lorem.sentence(6), quote: Faker::Movie.quote, role: 0, created_at: rand(1.years).seconds.ago)
#   puts "Created #{i} users!"

#   rand(1..10).times do |i|
#     user.skills.create(name: Faker::Job.key_skill, level: 'Advanced', created_at: rand(1.years).seconds.ago)
#   end
# end

User.create(username: 'admin', email: 'admin@admin.com', password: 'mmmk', avatar_url: Faker::Avatar.unique.image, about: 'admin', cover_letter: 'admin', role: 1)