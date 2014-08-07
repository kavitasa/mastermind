class CLI
  attr_reader :command, :sequence, :printer, :guess_counter  # => nil
  attr_accessor :start_time                                  # => nil

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
    until game.won? || game.quit?
      printer.enter_guess
      game.store_guess(gets.strip.downcase.chars)
      if game.quit?
        printer.end_game
        exit
      elsif game.guess_valid?
        result = game.play_round
      elsif game.guess_too_short?
        printer.guess_too_short
      else
        printer.guess_too_long
      end
    end
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
end
