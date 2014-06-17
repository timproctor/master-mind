gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_validator'
require './lib/guess'
require './lib/code_generator'

class CodeValidatorTest<Minitest::Test
  def test_validator_exists
    guess = Guess.new('rrrr')
    code  = CodeGenerator.new('beginner')
    validator = CodeValidator.new
  end

  def test_tells_how_many_letter_are_a_match
    guess = Guess.new('rgby')
    code  = Code.new('rrrr')
    validator = CodeValidator.new
    assert_equal 1, validator.checker(guess, code)
  end

  def test_tells_how_many_positions_are_a_match
    guess = Guess.new('rgby')
    code  = Code.new('rrrr')
    validator = CodeValidator.new
    assert_equal 1, validator.checker_index(guess, code)
  end


end
