class CLI
  attr_reader :command, :sequence, :guess

  def initialize
    @command = ""
  end

  def run
    puts "Welcome to Mastermind."
    until command == "q"
      print "Enter command: "
      @command = gets.strip
      process_user_commands
    end
  end

  def process_user_commands
    case
    when play?
      game_status = Game.new.play_game
      @command = "q" if game_status == false
    when instructions?
      display_instructions
    when quit?
      end_game
    else
      invalid_command
    end
  end

  def invalid_command
    puts "Invalid command."
  end

  def end_game
    puts "Good bye!"
  end

  def display_instructions
    puts "Printing instructions."
  end

  def play?
    command == "p"
  end

  def instructions?
    command == "i"
  end

  def quit?
    command == "q"
  end
end
