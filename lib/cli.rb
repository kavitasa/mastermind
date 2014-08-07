class CLI
  attr_reader :command, :sequence, :printer, :guess_counter
  attr_accessor :start_time

  def initialize(printer)
    @command = ""
    @printer = printer
  end

  def run
    welcome = printer.welcome_message
    until quit?
      @command = gets.strip
      process_user_commands
    end
  end

  def play_game
    game = Game.new(printer)
    printer.start_game_play
    until game.won? || quit?
      printer.enter_guess
      @command = gets.strip.downcase
      game.store_guess(command.chars)
      case
        when quit?
          printer.end_game
          run
        when backdoor?
          game.show_answer
        when guess_valid?
          game.play_round
        when guess_too_short?
          printer.guess_too_short
        else
          printer.guess_too_long
      end
    end
  end

  def guess_valid?
    command.length == 4
  end

  def guess_too_short?
    command.length < 4
  end

  def process_user_commands
    case
    when play?
      play_game
    when instructions?
      printer.display_instructions
      printer.ask_play_or_quit
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

  def backdoor?
    command == "bd" || command == "backdoor"
  end

end
