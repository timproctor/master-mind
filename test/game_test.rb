gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/guess'
# require './lib/code_validator'

class GameTest < Minitest::Test
  def test_game_begins
    game = Game.new
  end

  def test_that_new_game_has_no_guesses
    game = Game.new
    assert_equal 1, game.num_of_guesses
  end

  def test_that_a_guess_will_add_to_guesses
    game = Game.new
    game.turn('rgby')
    assert_equal 2, game.num_of_guesses
  end

  def test_that_a_history_of_guesses_exists
    game = Game.new
    guess = Guess.new('rrrr')
    game.turn('rrrr')
    game.turn('rggg')
    game.turn('gggg')
    assert_equal ['rrrr', 'rggg', 'gggg'], game.history
  end

  def test_that_a_turn_starts_time
    game = Game.new
    game.turn('rrrr')
    assert_equal 1,  game.times.length
  end

end
