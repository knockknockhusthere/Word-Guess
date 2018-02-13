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
    @guess_counter = 5
    @picture = [
      " ,d88b.d88b, ",
      " 88888888888 ",
      " `Y8888888Y' ",
      "   `Y888Y'   ",
      "     `Y'     "]
    @guess_status = []
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
    @picture.each do |line|
      @guess_counter.times do
        print line
      end
      print "\n"
    end
  end

  #
  def win_or_lose
    status = @guess_status.include?("_ ")
    #puts "\nSTATUS before loop"
    #puts status.inspect
    #puts "\nGUESS COUNTER before loop"
    #puts @guess_counter.inspect
    if status == false
      puts "Congratulations! You won, will you be my valentine?"
      exit
    elsif status == true && @guess_counter == 0
      puts "Oh no! You lost, but the chocolate is discounted."
      exit
    end
    return status
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
puts "\n" + current_word + "\n"
secret_word = Word.new(current_word)

#create instance of GameBehaviors
game = GameBehaviors.new(secret_word)

update_guess_counter = "placeholder"

counter = 1

until update_guess_counter == 0
  #place art

  #get used guess and re-print
  if counter == 1

    game.print_ascii_art
    puts "\n"

    underscores = game.create_underscores

    puts "\n\nChoose a letter: "
    user_guess = gets.chomp
    until user_guess =~ /^[a-zA-Z]$/
      puts "Sorry, thats not a letter. Try again: "
      user_guess = gets.chomp
    end
  else

    game.print_ascii_art
    puts "\n"

    puts game.replace_underscores(user_guess, secret_word)

    game_over = game.win_or_lose()

    puts "\n\nChoose a letter: "
    user_guess = gets.chomp
    
    until user_guess =~ /^[a-zA-Z]$/
      puts "Sorry, thats not a letter. Try again: "
      user_guess = gets.chomp
    end

  end
puts "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
  true_false = secret_word.compare_letter_to_word(user_guess)
  game.update_guess_counter(true_false)
  counter += 1

end
