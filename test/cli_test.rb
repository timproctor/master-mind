gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/code_validator'
require './lib/guess'
require './lib/code_generator'
require './lib/game'
require './lib/cli'

class CliTest < Minitest::Test
  attr_reader :cli

  def setup
    guess     = Guess.new('rgbg')
    code      = Code.new('rrrr')
    game      = Game.new
    @cli    ||= Cli.new(game)
  end

  def test_it_exists
    assert cli
  end

  def test_it_takes_commands
    assert cli.commands
  end

  def test_it_takes_turns
    assert cli.turns
  end

  def test_it_has_a_game
    assert cli.game
  end

  def test_it_can_process_input
    input   = '   Q '
    result  = cli.process_input(input)

    assert_equal 'q', result
  end

  def test_it_formats_turns
    input     = '  RGXY'
    result    = cli.format_turn(input)

    assert_equal 'rgy', result
  end

  def test_it_assigns_instructions
    input    = 'p'
    instruct = cli.process_input(input)
    cli.assign_instructions(instruct)
    assert cli.execute_commands
  end
end
