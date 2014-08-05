class Sequence
  attr_reader :secret_code

  def initialize
    @secret_code = []
    4.times { @secret_code << %w[r b y g].sample }
    puts secret_code.inspect
  end

  def correct_positions(guess)
    matches = 0

    guess.each_with_index do |color, position|
      matches += 1 if secret_code[position] == color
    end

    matches
  end

  def correct_colors(guess)
    matches            = 0
    duplicate_secret_code = secret_code.dup

    guess.each do |color|
      if duplicate_secret_code.include?(color)
        matches += 1
        color_index = duplicate_secret_code.index(color)
        duplicate_secret_code.delete_at(color_index)
      end
    end

    matches
  end

  def win?(guess)
    secret_code == guess
  end
end
