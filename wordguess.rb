word_dictionary = ["apple", "banana", "oranges", "pineapple", "avocado"]

# start of word class
class Word

  attr_reader :current_word

  def initialize (current_word)
    @word_array = current_word.split("")
    @all_guesses = []
  end

# store guessed letter into an array
# checks word for the guessed letter
  def compare_letter_to_word(guessed_letter)
    @all_guesses << guessed_letter
    @word_array.include?(guessed_letter)
  end  

end
# end of word class

# start of game behaviors class
class Game_Behaviors

def initialize
  @guess_counter = 8
end

# end of game behaviors class




def choose_word (word_dictionary)
  word = word_dictionary.sample
  used_word = []
  used_word << word
  return word
end






new_word = Dictionary.new(word_dictionary).choose_word
puts new_word

puts "Choose a letter: "
user_guess = gets.chomp
user_guesses << user_guess
