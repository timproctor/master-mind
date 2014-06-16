gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_generator'



class CodeGeneratorTest<Minitest::Test
  def test_that_it_exists
    generator = CodeGenerator.new("beginner")
    assert_equal "rgby", generator.level
  end

  def test_that_code_is_advanced
    generator = CodeGenerator.new("advanced")
    assert_equal "roygbp", generator.level
  end

  def test_that_code_is_expert
    generator = CodeGenerator.new("expert")
    assert_equal "roygbpwb", generator.level
  end


end
