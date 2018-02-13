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
    @picture = [
      " ,d88b.d88b, ",
      " 88888888888 ",
      " `Y8888888Y' ",
      "   `Y888Y'   ",
      "     `Y'     "]
    @guess_status = []
    #@word_length = word_length #update
  end

  def update_guess_counter(true_false)
    @guess_counter -= 1 if true_false == false
    return @guess_counter
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
    # heart = [
    #   " ,d88b.d88b, ",
    #   " 88888888888 ",
    #   " `Y8888888Y' ",
    #   "   `Y888Y'   ",
    #   "     `Y'     "]
      @picture.each do |line|
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

#intro
puts "Welcome to Val's Word Guess!\n\n"
puts "In this game, you will guess the letters for a hidden word."
puts "Careful though! One heart will disappear each time you guess incorrectly.\n\n"
puts "Start by choosing your first letter\n\n"

#create instance of Word
current_word = choose_word(word_dictionary)
puts current_word
secret_word = Word.new(current_word)

#create instance of GameBehaviors
game = GameBehaviors.new(secret_word)

update_guess_counter = "placeholder"

until update_guess_counter == 0

  counter = 1

  #place art
  game.print_ascii_art
  puts "\n"

  if counter = 1
    underscores = game.create_underscores
    game.replace_underscores(user_guess, secret_word)
  end


  #user input
  puts "\n\n\nChoose a letter: "
  user_guess = gets.chomp


  true_false = secret_word.compare_letter_to_word(user_guess)
  updated_guess_counter = game.update_guess_counter(true_false)
  counter += 1
end

#game.replace_underscores(user_guess,secret_word)




# puts secret_word.compare_letter_to_word(user_guess)
# game_one = GameBehaviors.new(secret_word)
#
# puts game_one.update_guess_counter(true_false).inspect
#
# game_one.create_underscores
# puts "\n"
# game_one.print_ascii_art
#
# print game_one.replace_underscores(user_guess,secret_word)
# # end body
