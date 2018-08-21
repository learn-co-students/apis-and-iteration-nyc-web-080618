require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)




  selected_character = response_hash["results"].find do |char|
    char["name"].downcase == character
  end

end

def get_movies_array(selected_character)
  movies_array = []
  selected_character["films"].each do |film_url|
    movie = RestClient.get(film_url)
    movie = JSON.parse(movie)
    movies_array << movie["title"]
    movies_array
  end
  movies_array
end

def print_movies(films_array)
  films_array.each do |film|
    puts film
  end
end

def show_character_movies(character)
  character_hash = get_character_movies_from_api(character)
  movie_array = get_movies_array(character_hash)
  print_movies(movie_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
