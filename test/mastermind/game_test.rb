gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_beg_sequence
    beg_sequence = Game.new.beg_sequence
    assert_equal "rgby", beg_sequence
  end

  # def test_beg_sequence_is_four_letters_long
  #
  # end

  # def test_beg_sequence_only_contains_rgby
  #
  # end
#
#   def test_evaluate_guesses_input
#     test if 'q' was entered
#      if not 'q', test that guess is 4 charac long
#        if fewer than 4 letters, tell them it's too short
#        if longer than 4 letters, thell them it's too long
#     test that guess only contains the letters 'rgby', case insensitive
#   end
#
#   def test_end_game_if_guess_is_correct
#    if they guess the secret sequence, enter the end game flow
#   end
#
#   def test_output_if_guess_is_incorrect
#
#   end
#
#   def test_track_number_of_guesses
#
#   end
#
#   def test_time_taken_to_guess_correctly
#
#   end
#
#   def test_evaluate_guess_letter_case
#
#   end
#
#   def test_correct_guess_letter_case_if_needed
#
#   end
#
#   def test_guess_input
#
#   end

end
