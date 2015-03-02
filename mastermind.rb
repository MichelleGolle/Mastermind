require_relative 'response'
require_relative 'runner'
require_relative 'game_logic'

class Mastermind

  mastermind = GameLogic.new
  runner = Runner.new

  puts mastermind.greeting

  runner.run do |input|
    response = mastermind.execute(input)
    puts response.message
    if response.status == :quit
      runner.stop
    end
  end

end
