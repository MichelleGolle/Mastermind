require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end

  def test_it_makes_user_guess_again
    mm = Mastermind.new
    result = mm.execute("BBBB")
    assert result.message.downcase.include?("guess again")
  end

  def test_game_ends_when_won
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert_equal :won, result.status
  end

  def test_game_continues_after_wrong_guess
    mm = Mastermind.new
    result = mm.execute("BBBB")
    assert_equal :continue, result.status
  end

  def test_it_can_quit_the_current_game
  #typing quit should direct to main directory
  #then option to quit again
  end

  def test_it_can_quit_entire_program
  #similar to above
  end

end
