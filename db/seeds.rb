# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts 'destroying Movies DB...'
Movie.destroy_all
List.destroy_all
puts 'Movies DB destroyed!!!!!!!!'

10.times do
  Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Movies::StarWars.quote,
    poster_url: 'https://source.unsplash.com/random',
    rating: rand(0.1..10).to_f.round(1)
  )
  list = List.create(
    name: Faker::Games::Pokemon.name
  )
  file = URI.open("https://source.unsplash.com/1600x900/?beach")
  list.photo.attach(io: file, filename: 'movie.png', content_type: 'image/png')
  list.save
  sleep(3)
end

puts "you just created #{Movie.count} fake movies and #{List.count} fake lists"
