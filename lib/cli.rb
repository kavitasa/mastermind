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
      process_app_instructions
    end
  end

  def process_app_instructions
    case
    when play?
      play_game
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

  def play_game
    puts "Game initialized."
    @sequence = generate_sequence
    @guess    = ""
    puts sequence.inspect
    until win? || quit_game?
      print "Enter your guess: "
      @guess = gets.strip.chars
      case
      when win?
        puts "You win."
      when quit_game?
        puts "Game finished."
        @command = "q"
      else
        puts "You have #{correct_colors} colors and #{correct_positions} correct positions."
      end
    end
  end

  def correct_positions
    matches = 0

    guess.each_with_index do |color, position|
      matches += 1 if sequence[position] == color
    end

    matches
  end

  def correct_colors
    matches            = 0
    duplicate_sequence = sequence.dup

    guess.each do |color|
      if duplicate_sequence.include?(color)
        matches += 1
        color_index = duplicate_sequence.index(color)
        duplicate_sequence.delete_at(color_index)
      end
    end

    matches
  end

  def correct_colors?
    @guess.any? { |color| sequence.include?(color) }
  end

  def generate_sequence
    sequence = []

    4.times { sequence << %w[r b y g].sample }

    sequence
  end

  def quit_game?
    guess == ['q']
  end

  def win?
    sequence == guess
  end

  def quit?
    command == "q"
  end

  def play?
    command == "p"
  end

  def instructions?
    command == "i"
  end
end
