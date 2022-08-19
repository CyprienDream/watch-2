# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


PICTURES = %w[https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg
              https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg
              https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg
              https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg].freeze
puts 'destroying bookmarks...'
Bookmark.destroy_all
puts 'destroying movies...'
Movie.destroy_all
puts 'destroying lists...'
List.destroy_all
puts 'creating movies...'
url = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
response = JSON.parse(url)
response['results'].each do |result|
  Movie.create!(title: result['original_title'],
               overview: result['overview'],
               rating: result['vote_average'],
               poster_url: PICTURES.sample)
  puts "new movie added"
end
