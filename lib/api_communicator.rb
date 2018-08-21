require 'rest-client'
require 'json'
require 'pry'

def show_choice(choice_and_input)
  user_choices = get_info_from_api(choice_and_input)
  print_choice(user_choices)
end

def get_info_from_api(choice_and_input)
  #make the web request
  response_string = ""
  if choice_and_input[0] == "planets" || choice_and_input[0] == "starships"
    response_string = RestClient.get("http://swapi.co/api/films/")
  else
    response_string = RestClient.get("http://www.swapi.co/api/people/")
  end
  response_hash = JSON.parse(response_string)

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.
  choice_array(response_hash, choice_and_input).map do |url|
    JSON.parse(RestClient.get(url))
  end
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

def choice_array(response_hash, choice_and_input)
  choice_array = []
  response_hash["results"].each do |character_hash|
    if choice_and_input[0] == "people" && character_hash["name"] == choice_and_input[1]
      choice_array << character_hash["films"]
    elsif character_hash["films"].include?(choice_and_input[1])
      choice_array << character_hash["films"]
    end
  end
  choice_array.flatten!
end

def print_choice(choice_hash)
  # some iteration magic and puts out the movies in a nice list
  choice_hash.each do |film|
    puts film["title"]
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
