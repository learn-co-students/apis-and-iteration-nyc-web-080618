require 'pry'
def welcome
  puts "Welcome!"
end

def get_character_from_user
  puts "Please enter a character"
  character = gets.chomp
  character.downcase
end
