class CLI
  attr_reader :command, :sequence, :guess, :printer

  def initialize(printer)
    @command = ""
    @printer = printer
  end

  def run
    welcome = printer.welcome_message
    until quit?
      printer.enter_command
      @command = gets.strip
      process_user_commands
    end
  end

  def process_user_commands
    case
    when play?
      Game.new.play_game
    when instructions?
      printer.display_instructions
    when quit?
      printer.end_game
    else
      printer.invalid_command
    end
  end

  def play?
    command == "p" || command == "play"
  end

  def instructions?
    command == "i" || command == "instructions"
  end

  def quit?
    command == "q" || command == "quit"
  end
end

class CLI
  def play_game
    game = Game.new
    until game.over?
      guess = get_guess(game)
    end
  end
end
