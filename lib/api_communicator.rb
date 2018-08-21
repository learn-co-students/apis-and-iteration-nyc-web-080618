require 'rest-client'
require 'json'
require 'pry'
require 'rest-client'



def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  film_urls = []
  response_hash["results"].each do |character_hash|
    if character_hash["name"] == character
      film_urls = character_hash["films"]
    end
  end

  film_urls.map do |url|
    film_string = RestClient.get(url)
    films_hash = JSON.parse(film_string)
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

def get_crawls_from_movie_title(movie_title)
  response_string = RestClient.get('http://www.swapi.co/api/films/')
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |movie_hash|
    if movie_hash["title"] == movie_title
      puts movie_hash["opening_crawl"].chomp
    end
  end
end

def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  title_arr = films_array.map do |film_hash|
    film_hash["title"]
  end

  puts title_arr
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

# binding.pry
