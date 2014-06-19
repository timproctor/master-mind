gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_generator'
require './lib/code'


class CodeGeneratorTest<Minitest::Test
  def test_that_it_exists
    generator = CodeGenerator.new("beginner")
    assert_equal ["r","g","b","y"] , generator.level
  end

  def test_that_code_is_advanced
    skip
    generator = CodeGenerator.new("advanced")
    assert_equal ["r","o","y","g","b"] , generator.level
  end

  def test_that_code_is_expert
    skip
    generator = CodeGenerator.new("expert")
    assert_equal ["r","o","y","g","b","p"], generator.level
  end

end
