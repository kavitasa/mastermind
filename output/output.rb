class Output

  def welcome_message
    puts "Welcome to MASTERMIND!"
  end

  def enter_command
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "Enter command: "
  end

  def enter_guess
    print "Enter your guess: "
  end

  def display_instructions
    puts "Printing instructions."
  end

  def invalid_command
    puts "Invalid command."
  end

  def win_message
    puts "You win!"
  end

  def end_game
    puts "Good bye!"
  end

end
