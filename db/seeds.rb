10.times do
  User.create(name: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)
end
