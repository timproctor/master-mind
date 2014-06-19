gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
# require './lib/guess'
require 'pry'
# require './lib/code_generator'
require './lib/code_validator'

class CodeValidatorTest<Minitest::Test
  def test_validator_exists
    guess = Guess.new('rrbr')
    code  = Code.new('rbrr')
    validator = CodeValidator.new
  end

  def test_tells_how_many_letter_are_a_match
    guess = Guess.new('rrbr')
    code  = Code.new('rbrr')
    validator = CodeValidator.new
    assert_equal 4, validator.checker(guess, code)
  end

  def test_tells_how_many_positions_are_a_match
    guess = Guess.new('rrbr')
    code  = Code.new('rbrr')
    validator = CodeValidator.new
    assert_equal 2, validator.checker_index(guess, code)
  end

  def test_is_a_full_match_game_over
    guess = Guess.new('rrrr')
    code  = Code.new('rrrr')
    validator = CodeValidator.new
    assert true, validator.full_match?(guess, code)
  end

end
