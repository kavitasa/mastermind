class Game
  attr_reader :sequence, :guess

  def initialize
    puts "Game initialized."
    @sequence = generate_sequence
    puts sequence.inspect
  end

  def play_game
    @guess    = ""
    until win? || quit_game?
      print "Enter your guess: "
      @guess = gets.strip.chars
      case
      when win?
        puts "You win."
      when quit_game?
        puts "Game finished."
      else
        puts "You have #{correct_colors} colors and #{correct_positions} correct positions."
      end
    end
    return win?
  end

  private

  def generate_sequence
    sequence = []
    4.times { sequence << %w[r b y g].sample }
    sequence
  end

  def win?
    sequence == guess
  end

  def quit_game?
    guess == ['q']
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

  def correct_positions
    matches = 0

    guess.each_with_index do |color, position|
      matches += 1 if sequence[position] == color
    end

    matches
  end

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
