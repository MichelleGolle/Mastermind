require_relative 'response'

class Mastermind

attr_reader :secret

  def initialize
  @secret = "rgby"
  end



  def execute(input)
     if input == "p" || input == "play"
       Response.new(:message => "I have generated a beginner sequence with four elements made up of: (r)ed,
         (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
         What's your guess?", :status => :continue)
     elsif input == "q" || input == "quit"
       Response.new(:message => "Goodbye", :status => :won) #need to change so that there is an end status other than won
     elsif input == "i"
       Response.new(:message => "Instructions etc", :status => :continue)
     elsif input.length < 4
       Response.new(:message => "Too short", :status => :continue)
     elsif input.length > 4
       Response.new(:message => "Too long", :status => :continue)
    elsif input == @secret
      Response.new(:message => "You Win!", :status => :won)
    else
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end
end


  #Should all of the below go in execute?
  #:continue = true
    #while :continue == true
      # if input == "p"
      #   puts printer.begin_game_message #response message is info on how to start game/request for guess
      #     #need to make sure status is continue
      # elsif input == "i"
      #   puts printer.instructions #response is instructions for playing the game and
      #     #need to make sure status is continue
      # elsif input == "q"
      #   puts printer.goodbye #message is goodbye and
      #   #need to make sure status is end/don't continue
      #   #:continue = false
      # else
      #   puts printer.invalid_input
      #   #status should be continue
      #   end
      #end

#need to create random color sequence



#somewhere I need to add the function that gives a message telling user which
#colors and positions are correct; could possibly change input and secret into
#arrays and then count how many matches to determine number of colors matching
#to determine number of positions matching we will have to go through each index
#and say if input[index] equals secret[index] add one to the counts
