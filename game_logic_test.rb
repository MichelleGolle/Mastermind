require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game_logic'


class GameLogicTest < Minitest::Test

  def test_it_starts_with_0_guesses
    gl = GameLogic.new
    assert_equal 0, gl.guess_count
  end

  def test_a_valid_input_increments_the_guess_count
    gl = GameLogic.new
    assert_equal 0, gl.guess_count
    gl.execute("RRRR")
    assert_equal 1, gl.guess_count
  end

  def test_a_winning_guess_increments_the_guess_count
    gl = GameLogic.new
    gl.start_tracking_time
    gl.stop_tracking_time
    assert_equal 0, gl.guess_count
    gl.execute(gl.secret)
    assert_equal 1, gl.guess_count
  end

  def test_it_wins
    gl = GameLogic.new
    gl.start_time = Time.now
    gl.end_time = Time.now
    result = gl.execute(gl.secret)
    assert result.message.downcase.include?("congratulations")
  end

  def test_it_makes_user_guess_again
    gl = GameLogic.new
    result = gl.execute("BBBB")
    assert result.message.downcase.include?("guess again")
  end

  def test_game_continues_to_main_menu_when_won
    gl = GameLogic.new
    gl.start_time = Time.now
    gl.end_time = Time.now
    result = gl.execute(gl.secret)
    assert_equal :continue, result.status
  end

  def test_game_continues_after_wrong_guess
    gl = GameLogic.new
    result = gl.execute("BBBB")
    assert_equal :continue, result.status
  end

  def test_it_can_quit_the_current_game
    gl = GameLogic.new
    result = gl.execute("quit")
    assert_equal :quit, result.status
  end

  def test_it_can_quit_entire_program
    gl = GameLogic.new
    result = gl.execute("quit")
    assert_equal :quit, result.status
  end

  def test_it_give_instructions
    gl = GameLogic.new
    result = gl.execute("i")
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. To play, enter a guess made up of these color combinations that is four letters in length. After you enter a guess I will provide clues to the secret code and you will continue guessing until the code is guessed. The game is scored based on number of guesses as well as time taken. Type (q)uit at any time to return to the main menu.", result.message
  end

  def test_it_cheats
    gl = GameLogic.new
    result = gl.execute("c")
    assert_equal gl.secret, result.message
  end

  def test_it_tells_when_input_too_short
    gl = GameLogic.new
    result = gl.execute("rgg")
    assert_equal "Too short", result.message
  end

  def test_it_tells_when_input_too_long
    gl = GameLogic.new
    result = gl.execute("rggbb")
    assert_equal "Too long", result.message
  end

  def test_it_generates_string_for_secret
    gl = GameLogic.new
    result = gl.secret
    assert_equal String, result.class
  end

  def test_secret_is_four_letters
    gl = GameLogic.new
    result = gl.secret
    assert_equal 4, result.length
  end

  def test_it_counts_number_of_correct_colors_in_a_guess
    gl = GameLogic.new
    assert_equal 2, gl.count_colors("rrgy", "byrb")
  end

  def test_it_counts_number_of_correct_positions_in_a_guess
    gl = GameLogic.new
    assert_equal 2, gl.count_positions("ggrb", "byrb")
  end

end
