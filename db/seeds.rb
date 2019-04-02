# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

fake_usernames = []
5.times {fake_usernames << Faker::Internet.username}
fake_usernames.each {|username| User.create(username: username)}

fake_titles = []
10.times {fake_titles << Faker::Kpop.girl_groups}
fake_urls = []
10.times {fake_urls << Faker::Internet.url}
(1..10).each {|i| Artwork.create(title: fake_titles[i], image_url: fake_urls[i], artist_id: rand(10)) }