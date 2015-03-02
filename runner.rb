class Runner

  def initialize
    @run = true
  end

  def run
    until @run == false
      print "> "
      yield(gets.chomp)
    end
  end

  def stop
    @run = false
  end

end
