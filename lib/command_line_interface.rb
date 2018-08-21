def welcome
  puts "This is not the Star-Wars API You're Looking For"
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
    # puts character.downcase
  show_character_movies(character)
end


def get_movie_from_user
  puts "please enter a movie title"
  movie = gets.chomp
  get_crawls_from_movie_title(movie)
end


def another_input
  puts "type 'character' or 'movie' to select another field"
  character = gets.chomp
  get_character_from_user
  movie = gets.chomp
  get_movie_from_user
end
