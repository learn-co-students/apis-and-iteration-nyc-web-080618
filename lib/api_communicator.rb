require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  people_url = "http://www.swapi.co/api/people/" #assign url
  # response_string = RestClient.get('http://www.swapi.co/api/people/')
  # response_hash = JSON.parse(response_string)
  # results = response_hash["results"]
  response_hash = get_response_hash(people_url)
  results = response_hash["results"] #using helper method, gets response hash for characters
  find_character = results.find do |result| #find character from results hash
    result["name"].downcase == character
  end
  list_of_urls = find_character["films"] #gets film api url
  list_of_urls.map do |url| #gets titles
    film = get_response_hash(url)
    film["title"]
  end

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def get_response_hash(url) #helper method to get hash
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  # titles = films_hash.map do |film|
  #   response_string = RestClient.get(film)
  #   response_hash = JSON.parse(response_string)
  #   response_hash["title"]
  # end
  puts films_hash
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end
#commit
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
