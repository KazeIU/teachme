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

test_url = "https://kitt.lewagon.com/placeholder/users/takumamatata"
test_user= User.new(email: "test@gmail.com", password: "123456", first_name: "Takuma", last_name: "Naruke")
test_user.remote_photo_url = test_url
test_user.save

20.times do
  url = "https://kitt.lewagon.com/placeholder/users/random"
  user_new = User.new(email: Faker::Internet.email, password: "123456", first_name: Faker::HarryPotter.character.split[0], last_name: Faker::HarryPotter.character.split[1])
  user_new.remote_photo_url = url
  user_new.save
end
puts "Created #{User.count} users"

languages = ["English", "Japanese", "French"]
level = ["Novice", "Conversational", "Business", "Fluent"]
location = ["Meguro, Tokyo", "Shibuya, Tokyo", "Yokohama, Kanagawa"]
duration = [40, 60, 90]
price = [2000, 3000, 5000]

50.times do
  Lesson.create(language: languages.sample, user_id: User.all.sample.id, duration: duration.sample, price: price.sample, level: level.sample, location: location.sample)
end

puts "Created #{Lesson.count} lessons"

50.times do
  lesson = Lesson.all.sample
  appointment = Appointment.new(user_id: User.all.sample.id, lesson_id: lesson.id, start_time: Faker::Time.forward(30, :day))
  if appointment.user != lesson.user
    appointment.save
  end
end

puts "Created #{Appointment.count} appointments"

