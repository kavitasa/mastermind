require 'colorize'

class Output

  def welcome_message
    print "
                                                                      .uuu
    z@#*%c                      .uuzm*****%mu..             z**` .e@#N
   @!!!R.  #c              .z**                    ^*c       z    dT!!!!!>
  '!!!!!!N   *i         u**                            #s  :*   @?!!!!!!!R
  t!!!!!!!#u   *i    .@                                  ^$   :R!!!!!!!!!X
  '!!!!!!!!!#c   *i:#                                      ?> R!!!!!!!!!!X
  '!!!!!!!!!!!N   @                                         4W!!!!!!!!!!!>
  '!!!!!!!!!!!!Ru*                                           ?!!!!!!!!!!X
  'X!!!!!!!!!!!9~                                      .  .  'X!!!!!!!!!6
   R!!!!!!!!!!tF                                     z$#`   h &!!UR!!!!!F
   ?!!!!!$X!!!$                                    .@       X $WTR!!!!!X
    M!!!!!i#U!E  .                                @F        ! FdR!!!!!!f
    'X!!!!!#c'?u@#**$N.                         :$          F'9!!!!!!!@
     9!!!!!!!?NM      ^*c                      dF          ' @!!!!!!!X>
      R!!!!!!!!&         *e                   d            K<!!!!!!!XF
      'X!!!!!!!M>          ^N                f            < E!!!!!!X*
        t!!!!!!!#            ^N            :*      .e$*^  Fn!!!!!XP
         #X!!!!!!ML             *c       z*    .e$$$$$   M'!!!!W*
           **UX!!X@t  ^%u.         ***#).zd$$#$$$$$$$  <\*@***
                    'N    4$$$$$@$$$)$$#$$k4$$$$$$$$$E :$
                       ?>  *$$$$$$*:$$$W$$$ *$$$$$$$$   %
                      :*           ? ^#**  S  *$$$$$     ?
                      F            L      d$L            X
                      &           t$i    @$$$           f
                       *          $$$$$$$$$$\&        @
                        '*.      W'$$$$$$$$FM h    u#
                           ^*muz* % $$$$$$*:    `*
                                   # ^*** d
                                     *****

".red.bold
    puts "Welcome to MASTERMIND!".bold
    puts ""
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit? "
  end

  def start_game_play
    puts "Let's begin!"
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

  def guess_too_short
    puts "Guess is too short"
  end

  def guess_too_long
    puts "Guess is toooooo lonnnnnnnng"
  end

  def round_results(correct_colors, correct_positions)
    puts "You have #{correct_colors} colors and #{correct_positions} correct positions."
  end

  def number_of_guesses(guess_counter)
    puts "You've taken #{guess_counter} guess(es)."
  end

  def win_message(format_guess, guess_counter, elapsed_minutes, elapsed_seconds)
    puts "Congratulations! You guessed the sequence '#{format_guess}' in #{guess_counter} guess(es) and #{elapsed_minutes} minutes and #{elapsed_seconds} seconds."
    ask_play_or_quit
  end

  def ask_play_or_quit
    print "Do you want to (p)lay or (q)uit? "
  end

  def end_game
    puts "Good bye!"
  end

  def show_answer(sequence)
    puts "The answer is #{sequence.secret_code.join}"
  end

end
