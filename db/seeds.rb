# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |n|
  Room.create!(
    name:"部屋名#{n+1}#00",
    place:"東京",
    number: 10,
    terms_of_use: "#{n+1}人以上で使用しないこと"
  )
  Entry.create!(
    user_name:"予約者名#{n+1}",
    user_email:"reserved_email#{n+1}@samplemail.com",
    reserved_date:"2022-04-#{n+1} 00:00:00",
    usage_time: n+1.to_f,
    room_id: n+1,
    people: n+1
  )
end