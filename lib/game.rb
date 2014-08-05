class Game
  attr_reader :sequence, :guess, :printer

  def initialize
    puts "Let's begin!"
    @sequence = Sequence.new
    @printer = Output.new
  end

  def play_game
    @guess = []
    until sequence.win?(guess) || quit_game?
      printer.enter_guess
      @guess = gets.strip.chars
      case
      when quit_game?
        printer.end_game
      when sequence.win?(guess)
        printer.win_message
      else
        correct_colors = sequence.correct_colors(guess)
        correct_positions = sequence.correct_positions(guess)
        puts "You have #{correct_colors} colors and #{correct_positions} correct positions."
      end
    end
    return sequence.win?(guess)
  end

  private

  def quit_game?
    command = guess.join.strip
    command == "q" || command == "quit"
  end

  # initialize
  #   secret
  #   history
  #def add_guess(guess)
  #sequence
  # add_guess
  # over?
  # won?
  # valid_guess?
  # num_guesses
  # correct_colors (for some guess)
    #def correct_colors(guess_number)
      #guesses[guess_number].correct_colors
    #end
  # correct_position (for some guess)

  # attr_reader :beg_sequence

  # def initialize(beg_sequence = "rgby")
  #   @beg_sequence = beg_sequence
  # end
  #
  # def beg_sequence
  #   @beg_sequence
  # end
  #
  # p @beg_sequence

  # def test_beg_sequence_is_four_letters_long
  #
  # end

  # def test_beg_sequence_only_contains_rgby
  #
  # end

  # def evaluate_guesses_input
  #   if not 'q', test that guess is 4 charac long
  #   if fewer than 4 letters, tell them it's too short
  #   if longer than 4 letters, thell them it's too long
  # end
  #
  # def end_game_if_guess_is_correct
  #   if they guess the secret sequence, enter the end game flow
  # end
  #
  # def output_if_guess_is_incorrect
  #
  # end
  #
  # def track_number_of_guesses
  #
  # end
  #
  # def time_taken_to_guess_correctly
  #
  # end
  #
  # def evaluate_guess_letter_case
  #
  # end
  #
  # def correct_guess_letter_case_if_needed
  #
  # end
  #
  # def guess_input
  #
  # end

end
