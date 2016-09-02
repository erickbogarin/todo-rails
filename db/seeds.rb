10.times do |x|
	Todo.create!(name: Faker::Name.name, description: Faker::Hacker.say_something_smart)
end