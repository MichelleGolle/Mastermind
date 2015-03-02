class Response
  attr_reader :message, :status

  def initialize
    @message
    @status = :menu
  end

  def greeting
    @message = "Welcome to Mastermind! Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
     @status = :menu
     self
  end

  def menu
    @message =  "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    @status = :menu
    self
  end

  def info
    @message =  "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    @status = :continue
    self
  end

  def correct_guess(secret, guess_count, display_elapsed_time)
    @message = "Congratulations! You guessed the sequence #{secret} in #{guess_count} guesses over #{display_elapsed_time}.
    Do you want to (p)lay again or (q)uit?"
    @status = :won
    self
  end

  def continue
    @message = "Guess again!"
    @status = :continue
    self
  end

  def too_short
    @message = "Too short"
    @status = :contine
    self
  end

  def too_long
    @message = "Too long"
    @status = :continue
    self
  end

  def evaluate_guess(count_colors, count_positions)
    @message = "Guess again! You got #{count_colors} colors and #{count_positions} positions correct."
    @status = :continue
    self
  end

  def cheat(secret)
    @message = secret
    @status = :continue
    self
  end

  def goodbye
    @message = "Goodbye!"
    if @status == :continue
      self.menu
    else
      @status = :quit
    end
    self
  end


end
