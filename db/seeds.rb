# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(name:  "Example User",
             email: "example@gmail.com",
             password:              "prince",
             password_confirmation: "prince",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)


users = User.all

50.times do
  content = Faker::Lorem.sentence(word_count: 20)
  users.each do |user|
    user.microposts.create!(content: content.truncate(140))
  end
end


users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


