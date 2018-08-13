# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Appointment.delete_all
Lesson.delete_all
User.delete_all

puts "Deleted all the past data"

User.create(email: "test@gmail.com", password: "123456", first_name: "John", last_name: "Doe")

10.times do
  User.create(email: Faker::Internet.email, password: "123456", first_name: Faker::HarryPotter.character.split[0], last_name: Faker::HarryPotter.character.split[1])
end
puts "Created #{User.count} users"

languages = ["English", "Japanese", "French"]
level = ["Novice", "Conversational", "Business", "Fluent"]
duration = [40, 60, 90]
price = [2000, 3000, 5000]

30.times do
  Lesson.create(language: languages.sample, user_id: User.all.sample.id, duration: duration.sample, price: price.sample, level: level.sample)
end

puts "Created #{Lesson.count} lessons"

50.times do
  Appointment.create(user_id: User.all.sample.id, lesson_id: Lesson.all.sample.id, start_time: Faker::Time.forward(30, :day))
end

puts "Created #{Appointment.count} appointment"
