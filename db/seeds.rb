# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
  # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.save!
   user.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
 end

admin = User.new(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    )
  admin.save!
 users = User.all

new_task = Task.new(
  body: "buy oranges",
  user: admin,
  created_at: (Time.now - 10.days)
  )
new_task.save!
newtask = Task.new(
  body: "sing in teh shower",
  user: admin,
  created_at: (Time.now - 10.days)
  )
newtask.save!

50.times do 
  task = Task.create!(
    body: Faker::Lorem.sentence,
    user: users.sample,
    )
   task.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
   task.save!
end

tasks = Task.all
