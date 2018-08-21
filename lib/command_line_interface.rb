require 'pry'

def welcome
 puts "This is not the Star-Wars API You're Looking For"
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  # puts character.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_movie_from_user
  puts "please enter a movie title"
  movie_title = gets.chomp
end

# binding.pry
