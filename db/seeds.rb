# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |n|
  Room.create!(
    name:"部屋名#{n}",
    place:"会議室#{n}",
    number: n,
    terms_of_use: "#{n}人以上で使用しないこと",
    created_at: "2022-04-04 14:00:00",
    updated_at: "2022-04-04 14:00:00"
  )
end