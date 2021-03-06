# Mastermind from Odin Project - http://www.theodinproject.com/ruby-programming/oop
# Create a mastermind game from the command line - will have no AI.
# Object oriented programming section.



# Main class that contains the core game.
class Mastermind
  def initialize
    @colors = ["BLACK", "WHITE", "RED", "YELLOW", "GREEN"]
    @guesses = 0
    @max_guesses = 12

     entrance
  end




  def entrance
    puts "This is Mastermind. Play a game?"
    response = gets.chomp.upcase

    validate_guess(response)
    if response == "YES"
      puts ""
      get_name
    else
      exit_game
    end
  end




  def validate_guess(response)
    @response = response

    until response == "YES" || response == "NO"
      puts ""
      puts "Say yes or no."
      response = gets.chomp.upcase
      guesses += 1
    end
  end




  def get_name
    puts "What\'s your name?"
    @name = gets.chomp
    puts ""
    instructions
  end




  def instructions
    puts "#{@name} do you know the rules?"
    response = gets.chomp.upcase

    validate_guess(response)

    if response == "YES"
      start_game
    elsif response == "NO"
      show_instructions
    else
      puts ""
    end
  end




  def show_instructions
    puts ""
    puts "View instructions?"
    response = gets.chomp.upcase

    if response == "YES"
      instructions
      puts ""
      puts "Play?"
      new_response = gets.chomp.upcase
      if new_response == "YES"
        start_game
      else
      end
    else
      puts ""
      puts "Enter 'play' or 'exit'"
      playexitresponse = gets.chomp.upcase

      if playexitresponse == "PLAY"
        play_game
      elsif playexitresponse == "EXIT"
        exit_game
      else
        puts "Try again."
        show_instructions
      end
    end
  end




  def exit_game
    puts ""
    puts "Goodbye."
    puts ""
    puts ""
    exit
  end




  def instructions
    puts ""
    puts "You must break a code consisting of 4 random integers."
    puts "You have 12 guesses. Red means you're wrong."
  end




  def take_guess
    while @guesses < @max_guesses
      @guesses += 1
      puts "Take a guess: "
      @guess = gets.chomp.upcase.split(", ")
      check_valid(@guess)
      puts ""
      puts "You have #{@max_guesses - @guesses} guesses left."
      puts ""
    end
  end




  def check_valid(guess)
    if guess.count == 4 && guess.all? { |x| @colors.include?(x) }
      evaluate_guess(@guess, @new_code)
    else
      incorrect_entry
    end
  end




  def evaluate_guess(guess, code)
    if guess.eql?(code)
      announce_winner
    else
      puts ""
      for i in 0..(guess.length - 1)
        if guess[i] == code[i]
          puts "Red peg for #{guess[i]}."
        elsif  code.include?(guess[i])
          puts "White peg for #{guess[i]}."
        else
          puts "BLANK"
        end
      i += 1
      end
    end
  end




  def announce_winner
    puts "You won!"
    new_game?
  end




  def new_game?
    @guesses = 0
    puts ""
    puts "Play again?"
    response = gets.chomp.upcase

    until response == "YES" || response == "NO"
      puts "Try again."
      response = gets.chomp.upcase
    end

    if response == "YES"
      puts "Here we go!"
      new_game
    elsif response == "NO"
      puts "Game over. Bye."
      puts ""
      puts ""
      exit
    end
  end




  def incorrect_entry
    puts "That is incorrect."
  end




  def max_guesses
    return 13
  end




  class Game
    attr_accessor :new_code

    def initialize
      @colors = ["BLACK", "WHITE", "RED", "YELLOW", "GREEN"]
      @new_code = @colors.sample(4)
      puts ""
    end
  end
end



a = Mastermind.new