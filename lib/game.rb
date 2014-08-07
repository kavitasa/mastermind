class Game
  attr_reader :sequence, :printer
  attr_accessor :guess, :guess_counter

  def initialize(printer)
    @sequence = Sequence.new
    @printer = printer
    @guess = []
    @guess_counter = 0
  end

  def store_guess(guess)
    @guess = guess
  end

  def format_guess
    guess.join.upcase
  end

  def show_answer
    printer.show_answer(sequence)
  end

  def guess_counter
    @guess_counter += 1
  end

  def play_round
    @start_time ||= Time.now
    # if quit?
    #   printer.end_game
    if won?
      @end_time = Time.now
      printer.win_message(format_guess, guess_counter, elapsed_minutes, elapsed_seconds)
      guess_counter
    else
      printer.round_results(correct_colors, correct_positions)
      printer.number_of_guesses(guess_counter)
    end
  end

  def won?
    sequence.secret_code == guess
  end

  def total_seconds
    (@end_time - @start_time).to_i
  end

  def elapsed_minutes
    total_seconds/60
  end

  def elapsed_seconds
    total_seconds%60
  end

  def correct_colors
    matches = 0
    duplicate_secret_code = sequence.secret_code.dup
    guess.each do |color|
      if duplicate_secret_code.include?(color)
        matches += 1
        color_index = duplicate_secret_code.index(color)
        duplicate_secret_code.delete_at(color_index)
      end
    end
    matches
  end

  def correct_positions
    matches = 0
    guess.each_with_index do |color, position|
      matches += 1 if sequence.secret_code[position] == color
    end

    matches
  end

end
