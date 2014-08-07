gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence'

class SequenceTest < Minitest::Test

  def test_sequence_exists
    assert Sequence.new
  end

  def test_sequence_has_a_secret_code
    assert Sequence.new.secret_code
  end

  def test_secret_code_is_right_length
    assert_equal Sequence.new.secret_code.length, 4
  end

  def test_secret_code_is_somewhat_random_less_than_25percent_repeats
    secret_codes = []
    100.times do
      secret_codes << Sequence.new.secret_code.join
    end
    repeats = secret_codes.length - secret_codes.uniq.length
    assert repeats < 25
  end

  def test_secret_code_contains_rgby_letters
    # other_letters = !Sequence.new.secret_code.include?["r"||"g"|| "b"|| "y"]
    # refute other_letters?
  end

  def test_secret_code_contains_other_letters

  end

end
