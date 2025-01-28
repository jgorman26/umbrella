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

google_maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{google_maps_key}"
raw_google_maps = HTTP.get(google_maps_url)
parse_google_maps = JSON.parse(raw_google_maps)
results_google_maps = parse_google_maps.fetch("results")
hash_google_maps = results_google_maps.at(0)
geo_google_maps = hash_google_maps.fetch("geometry")
loc_google_maps = geo_google_maps.fetch("location")
lat = loc_google_maps.fetch("lat")
lng = loc_google_maps.fetch("lng")
puts "Your are currently at longitude #{lng} and latitude #{lat}."

pirate_weather_url = "https://api.pirateweather.net/forecast/#{pirate_weather_key}/#{lat},#{lng}"
raw_pirate_weather = HTTP.get(pirate_weather_url)
parse_pirate_weather = JSON.parse(raw_pirate_weather)
current_pirate_weather = parse_pirate_weather.fetch("currently")
current_temp = current_pirate_weather.fetch("temperature")
puts "It is currently #{current_temp} degrees Fahrenheit at #{user_location}."
