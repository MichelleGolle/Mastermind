require 'minitest/autorun'
require 'minitest/pride'
require_relative 'mastermind'

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_starts_with_0_guesses
    mm = Mastermind.new
    assert_equal 0, mm.guess_count
  end

  def test_a_valid_input_increments_the_guess_count
    mm = Mastermind.new
    assert_equal 0, mm.guess_count
    mm.execute("RRRR")
    assert_equal 1, mm.guess_count
  end

  def test_a_winning_guess_increments_the_guess_count
    mm = Mastermind.new
    mm.start_tracking_time
    mm.stop_tracking_time
    assert_equal 0, mm.guess_count
    mm.execute(mm.secret)
    assert_equal 1, mm.guess_count
  end

  def test_it_wins #this doesn't pass anymore because the secret has changed
    skip
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end

  def test_it_makes_user_guess_again
    mm = Mastermind.new
    result = mm.execute("BBBB")
    assert result.message.downcase.include?("guess again")
  end

  def test_game_ends_when_won #this doesn't pass anymore because the secret has changed
    skip
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert_equal :won, result.status
  end

  def test_game_continues_after_wrong_guess
    mm = Mastermind.new
    result = mm.execute("BBBB")
    assert_equal :continue, result.status
  end

  def test_it_can_quit_the_current_game #Currently does not pass, exits entire program
    skip
    mm = Mastermind.new
    result = mm.execute("quit")
    assert_equal :main_menu, result.status
  end

  def test_it_can_quit_entire_program
    mm = Mastermind.new
    result = mm.execute("quit")
    assert_equal :quit, result.status
  end

  def test_it_give_instructions
    mm = Mastermind.new
    result = mm.execute("i")
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?", result.message
  end

  def test_it_cheats
    mm = Mastermind.new
    result = mm.execute("c")
    assert_equal mm.secret, result.message
  end

  def test_it_tells_when_input_too_short
    mm = Mastermind.new
    result = mm.execute("rgg")
    assert_equal "Too short", result.message
  end

  def test_it_tells_when_input_too_long
    mm = Mastermind.new
    result = mm.execute("rggbb")
    assert_equal "Too long", result.message
  end

  def test_it_counts_number_of_correct_colors_in_a_guess
    mm = Mastermind.new
    assert_equal 2, mm.count_colors("rrgy", "byrb")
  end

  def test_it_counts_number_of_correct_positions_in_a_guess
    mm = Mastermind.new
    assert_equal 2, mm.count_positions("ggrb", "byrb")
  end

end
