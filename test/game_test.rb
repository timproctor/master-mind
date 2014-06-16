gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
# require './lib/code_validator'

class GameTest < Minitest::Test
  def test_game_begins
    game = Game.new
  end

  def test_that_new_game_has_no_guesses
    game = Game.new
    assert_equal 0, game.guesses
  end

  def test_that_a_guess_will_add_to_guesses
    game = Game.new
    game.run('rgby')
    assert_equal 1, game.guesses
  end
end
