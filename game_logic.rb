require_relative 'response'

class GameLogic

attr_reader :secret, :guess_count, :responder
attr_writer :start_time, :end_time

  def initialize
     @secret = generate_secret
     @guess_count = 0
     @responder = Response.new
  end

  def generate_secret
    secret_combo = []
    letter_options = ["R", "G", "B", "Y"]
    4.times do
      secret_combo << letter_options.shuffle![0]
    end
    secret_combo.join.downcase
  end

  def start_tracking_time
    @start_time = Time.now
  end

  def stop_tracking_time
    @end_time = Time.now
  end

  def display_elapsed_time
    total_time = (@end_time - @start_time).to_i
    mm, ss = total_time.divmod(60)
    "#{mm} minutes, #{ss} seconds"
  end

  def execute(input)
    input = input.downcase
    if input == "p" || input == "play"
      start_tracking_time
      @responder.info
    elsif input == "q" || input == "quit"
      @responder.goodbye
    elsif input == "i"
      @responder.instructions
    elsif input == "c" || input == "cheat"
       @responder.cheat(@secret)
     elsif input.length < 4
       @responder.too_short
     elsif input.length > 4
       @responder.too_long
    elsif input == @secret
      count_guess!
      stop_tracking_time
      @responder.correct_guess(@secret, @guess_count, display_elapsed_time)
    else
      count_guess!
      color_count = count_colors(input)
      position_count = count_positions(input)
      @responder.evaluate_guess(color_count, position_count)
    end
  end

  def count_colors(input, code = secret)
    guess_array = input.chars
    unique_colors = guess_array.uniq
    unique_colors.count do |color|
      code.include?(color)
    end
  end

  def count_positions(input, code = secret)
    guess_array = input.chars
    pairs = guess_array.zip(code.chars)
    pairs.count do |color1, color2|
      color1 == color2
    end
  end

  def count_guess!
    @guess_count += 1
  end

  def status
    @responder.status
  end

  def greeting
    @responder.greeting.message
  end
end
