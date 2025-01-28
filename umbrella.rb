require "http"
require "json"
require "dotenv/load"

# Write your soltuion here!

google_maps_key = ENV.fetch("GMAPS_KEY")
pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")

puts "========================================"
puts "Will you need an umbrella today?"
puts "========================================"
puts "Where are you?"
user_location = gets.chomp
puts "Checking #{user_location}'s weather..."

google_maps_url = "https://www.google.com/maps/"
