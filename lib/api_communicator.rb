require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].find{ |char|
    char["name"].downcase==character }
end

def get_movies_array(selected_character)
  movies_array = []
  selected_character["films"].each do |film_url|
    movie = RestClient.get(film_url)
    movie = JSON.parse(movie)
    movies_array << movie
  end
  movies_array
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each{ |film|
    puts film["title"]  }
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  films_array=get_movies_array(films_array)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
