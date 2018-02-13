word_dictionary = ["valentine","cupid","heart","love","flowers","chocolate", "february", "roses", "sweetheart", "gifts", "dancing", "celebrate", "suitors", "forever", "promise", "flirt", "affection"]

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
class GameBehaviors

  def initialize (word)
    @word = word
    @guess_counter = 5
    @picture = []
    @guess_status = []
    @word_length = 0
  end

  def underscores
    @word_length.times do
      @guess_status << "__ "
    end
    return @guess_status
  end

  def print_ascii_art
    heart = [
      " ,d88b.d88b, ",
      " 88888888888 ",
      " `Y8888888Y' ",
      "   `Y888Y'   ",
      "     `Y'     "]
      heart.each do |line|
        @guess_counter.times do
          print line
        end
        print "\n"
      end

  end
end
# end of game behaviors class


# start regular functions
def choose_word (word_dictionary)
  word = word_dictionary.sample
  used_word = []
  used_word << word
  return word
end
# end regular functions


# start body
puts "Choose a letter: "
user_guess = gets.chomp


current_word = choose_word(word_dictionary)
puts current_word

word_length = current_word.length

word_one = Word.new(current_word)
puts word_one.compare_letter_to_word(user_guess)
game_one = GameBehaviors.new(word_one)

puts game_one.underscores
 game_one.print_ascii_art
# end body
