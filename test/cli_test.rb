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
    assert cli.turn
  end

  def test_it_has_a_game
    assert cli.game
  end

  def test_it_can_process_input
    skip
    input   = '   Q '
    result  = cli.process_input

    assert_equal 'q', result
  end

  def test_it_formats_turns
    skip
    input     = '  RGXY'
    result    = cli.format_turn

    assert_equal 'rgy', result
  end

  def test_it_assigns_instructions
    skip
    input    = 'p'
    instruct = cli.process_input
    cli.assign_instructions(instruct)
    assert cli.execute_game
  end
end
