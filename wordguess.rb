#word_dictionary = ["valentine","cupid","heart","love","flowers","chocolate", "february", "roses", "sweetheart", "gifts", "dancing", "celebrate", "suitors", "forever", "promise", "flirt", "affection"]
word_dictionary = ["valentine"]
# start of word class
class Word

  attr_reader :current_word

  def initialize (current_word)
    @word_array = current_word.split("")
    @all_guesses = [] #do we need this?
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
#@word_array = @word.instance_variable_get(:@word_array)
    @guess_counter = 5
    @picture = []
    @guess_status = []
    #@word_length = word_length #update
  end

  def create_underscores
    word_length = @word.instance_variable_get(:@word_array).length
    .times do
      @guess_status << "_ "
    end
    print_underscore = @guess_status.join("")
    print print_underscore
    return @guess_status
  end

  def replace_underscores (user_guess,word)

    array = @word.instance_variable_get(:@word_array)
    indexes_to_replace = array.each_with_index.map {|letter,i| letter == user_guess ? i : nil }.compact
    indexes_to_replace.each do |index|
      #letter = array[index] # letter that needs to go in place of the _ß
      @guess_status[index] = user_guess + " "
    end
    return @guess_status.join("")
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

#current word is the param for word_one (word they want to guess)
current_word = choose_word(word_dictionary)
puts current_word



#word_one is object form of current_word (is array)
word_one = Word.new(current_word)
puts word_one.compare_letter_to_word(user_guess)
game_one = GameBehaviors.new(word_one)

game_one.create_underscores
puts "\n"
game_one.print_ascii_art

print game_one.replace_underscores(user_guess,word_one)
# end body
