def welcome
  # puts out a welcome message here!
  puts "What's up hombre?"
  puts "Here are your search options"
  puts "1. Search for character movies"
  puts "2. Search for planet by film"
  puts "3. Search for starship by film"
end

def get_input_from_user
  puts "Please enter a number from above"
  choice = gets.chomp
  input = ""
  case choice
  when "1"
    puts "Input character name"
    input = gets.chomp
    choice = "people"
  when "2"
    puts "Input movie name"
    input = gets.chomp
    choice = "planets"
  when "3"
    puts "Input movie name"
    input = gets.chomp
    choice = "starships"
  else
    puts "Invalid choice, goodbye."
  end
  # use gets to capture the user's input. This method should return that input, downcased.
  [choice, input]
end
