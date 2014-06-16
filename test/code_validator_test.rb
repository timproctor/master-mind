gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_validator'
require './lib/guess'

class CodeValidatorTest<Minitest::Test
  def test_validator_exists
    game = CodeValidator.new(guess)
    assert_equal 'rgby', Guess.code
  end
end
