# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "admin_user",
  email: "admin_sample@sample.com",
  password: "admin_password",
  admin: true
)

5.times do |n|
  User.create!(
    name: "user#{n+1}",
    email: "user#{n+1}_sample@sample.com",
    password: "password"
  )
end

30.times do |n|
  Room.create!(
    name:"部屋名#{n+1}#00",
    place:"東京",
    number: 10,
    terms_of_use: "#{n+1}人以上で使用しないこと"
  )
  Entry.create!(
    user_id: 1,
    reserved_date:"2022-04-#{n+1} 00:00:00",
    usage_time: n+1.to_f,
    room_id: n+1,
    people: n+1
  )
end

5.times do |n|
  30.times do |m|
    Entry.create!(
      user_id: 2+n,
      reserved_date:"2022-05-#{m+1} 00:00:00",
      usage_time: n+1.to_f,
      room_id: m+1,
      people: m+1
    )
  end
end