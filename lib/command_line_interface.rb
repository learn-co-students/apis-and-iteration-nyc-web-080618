def welcome
  puts "What's up hombre?"
  puts "Search Options"
  puts "1. Search by character for movies"
  puts "2. Search by film for featured planets"
  puts "3. Search by film for featured starships"
end




def get_character_from_user
  puts "please enter number from above selection"
  # use gets to capture the user's input. This method should return that input, downcased.
  choice = gets.chomp
  if choice == "1"
    puts "Please enter character name"
    input = gets.chomp
    choice = "people"
  
  elsif choice == "2"
    puts "Please enter film title"
    input = gets.chomp
    choice = "planets"
  elsif choice == "3"
    puts "Please enter film title"
    input = gets.chomp
    choice = "starships"
  else
    puts "Invalid choice bro"
  end

[choice, input]


end
