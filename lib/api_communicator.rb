require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character) #use pry
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  #binding.pry


    new_hash = response_hash["results"].find do |film|
      film["name"].split.first == character
  end
    film_list = new_hash["films"]
    film_list

  # binding.pry

  film_list.collect do |url|
    film_url = JSON.parse(RestClient.get(url))
    film_url["title"]
    #binding.pry
  end

end

def print_movies(films_hash)
  counter = 0
  films_hash.map do |film|
    counter += 1
    puts "#{counter}  #{film}"
    binding.pry
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
