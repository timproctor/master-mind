gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest<Minitest::Test
  def test_a_guess_exists
    guess = Guess.new('rgby')
  end

  def test_a_guess_exists_and_takes_a_guess
    guess = Guess.new('rgby')
    assert_equal 'rgby', guess.attempt
  end


end
