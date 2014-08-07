class Sequence
  attr_reader :secret_code

  def initialize
    @secret_code = []
    4.times { @secret_code << %w[r b y g].sample }
  end
end
